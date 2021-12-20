import { Controller } from "stimulus"
import { DirectUpload } from "@rails/activestorage"
import Dropzone from "dropzone"
import { getMetaValue, findElement, removeElement, insertAfter } from "helpers"

Dropzone.autoDiscover = false

export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    this._inputTarget = this.element.nextElementSibling.querySelector('input')
    console.log(this.element)
    this.inputRequired = this._inputTarget.getAttribute('required')
    this.dropZone = createDropZone(this)
    this.bindEvents()
    this.preloadFiles()
  }

  bindEvents() {
    this.dropZone.on("addedfile", (file) => {
      setTimeout(() => {
        file.accepted && createDirectUploadController(this, file).start()
        this.completeAddingMockFile.call(this, file)
      }, 500)
    })

    this.dropZone.on("removedfile", (file) => {
      file.controller && removeElement(file.controller.hiddenInput)
      const hiddenInput = this._inputTarget.nextElementSibling

      if (this.inputRequired && hiddenInput.tagName !== "INPUT") {
        this._inputTarget.setAttribute('required', true)
      }
    })

    this.dropZone.on("canceled", (file) => {
      file.controller && file.controller.xhr.abort()
    })

    this.dropZone.on("processing", (file) => {
      if (this.submitButton) {
        this.submitButton.disabled = true
      }
    })

    this.dropZone.on("queuecomplete", (file) => {
      this._inputTarget.removeAttribute('required')
      if (this.submitButton) {
        this.submitButton.disabled = false
      }
    })
  }

  maxfilesexceeded(file) {
    this.removeAllFiles();
    this.addFile(file);
  }

  preloadFiles() {
    const files = this.element.parentElement.querySelectorAll(".preload-files .file")
    if (!files || !files.length) {
      return
    }

    const preloadFile = this.preloadFile.bind(this)
    files.forEach(preloadFile)
  }

  preloadFile(file) {
    const mockFileUrl = file.getAttribute("data-mock-file-url")
    if (!mockFileUrl) {
      return
    }

    const mockFile = {
      name: "image",
      type: file.getAttribute("data-content-type"),
      signedId: file.getAttribute("data-signed-id"),
      mockFile: true,
    };
    this.dropZone.addFile(mockFile);
    this.dropZone.options.thumbnail(mockFile, mockFileUrl);
  }

  completeAddingMockFile(file) {
    if (!file.mockFile) {
      return
    }

    file.controller.hiddenInput.value = file.signedId
    file.status = Dropzone.SUCCESS
    this.dropZone.emit("success", file)
    this.dropZone.emit("complete", file)
  }

  get headers() { return { "X-CSRF-Token": getMetaValue("csrf-token") } }

  get url() { return this._inputTarget.getAttribute("data-direct-upload-url") }

  get maxFiles() { return this.data.get("maxFiles") }

  get maxFileSize() { return this.data.get("maxFileSize") || 256 }

  get acceptedFiles() { return this.data.get("acceptedFiles") }

  get addRemoveLinks() { return this.data.get("addRemoveLinks") || true }

  get form() { return this.element.closest("form") }

  get submitButton() { return findElement(this.form, "input[type=submit], button[type=submit]") }

  get previewsContainer() { return findElement("#images-preview-container")}
}

class DirectUploadController {
  constructor(source, file) {
    this.directUpload = createDirectUpload(file, source.url, this)
    this.source = source
    this.file = file
  }

  start() {
    this.file.controller = this
    this.hiddenInput = this.createHiddenInput()
    this.directUpload.create((error, attributes) => {
      if (error) {
        removeElement(this.hiddenInput)
        this.emitDropzoneError(error)
      } else {
        this.hiddenInput.value = attributes.signed_id
        this.emitDropzoneSuccess()
      }
    })
  }

// Private
  createHiddenInput() {
    const input = document.createElement("input")
    input.type = "hidden"
    input.name = this.source._inputTarget.name
    insertAfter(input, this.source._inputTarget)
    return input
  }

  directUploadWillStoreFileWithXHR(xhr) {
    this.bindProgressEvent(xhr)
    this.emitDropzoneUploading()
  }

  bindProgressEvent(xhr) {
    this.xhr = xhr
    this.xhr.upload.addEventListener("progress", event => this.uploadRequestDidProgress(event))
  }

  uploadRequestDidProgress(event) {
    const element = this.source.element
    const progress = event.loaded / event.total * 100
    findElement(this.file.previewTemplate, ".dz-upload").style.width = `${progress}%`
  }

  emitDropzoneUploading() {
    this.file.status = Dropzone.UPLOADING
    this.source.dropZone.emit("processing", this.file)
  }

  emitDropzoneError(error) {
    this.file.status = Dropzone.ERROR
    this.source.dropZone.emit("error", this.file, error)
    this.source.dropZone.emit("complete", this.file)
  }

  emitDropzoneSuccess() {
    this.file.status = Dropzone.SUCCESS
    this.source.dropZone.emit("success", this.file)
    this.source.dropZone.emit("complete", this.file)
  }
}

// Top level...
function createDirectUploadController(source, file) {
  return new DirectUploadController(source, file)
}

function createDirectUpload(file, url, controller) {
  return new DirectUpload(file, url, controller)
}

function createDropZone(controller) {
  return new Dropzone(controller.element, {
    url: controller.url,
    headers: controller.headers,
    maxFiles: controller.maxFiles,
    maxfilesexceeded: controller.maxfilesexceeded,
    maxFilesize: controller.maxFileSize,
    acceptedFiles: controller.acceptedFiles,
    addRemoveLinks: controller.addRemoveLinks,
    autoQueue: false,
    previewsContainer: controller.previewsContainer,
    thumbnailWidth: 200,
    thumbnailHeight: 150,
  })
}
