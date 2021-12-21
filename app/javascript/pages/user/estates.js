window.estatesInit = {
  init() {
    this.initSidebar()
  },

  initSidebar() {
    $('.js-navbar-vertical-aside').hsSideNav();
  },
}

let autocomplete;
let address1Field;
let postalField;

window.initAutocomplete = () => {
  address1Field = document.querySelector("#estate_address");
  postalField = document.querySelector("#estate_postcode");

  autocomplete = new google.maps.places.Autocomplete(address1Field, {
    fields: ["address_components", "geometry"],
    types: ["address"],
  });
  address1Field.focus();
  autocomplete.addListener("place_changed", fillInAddress);
}

function fillInAddress() {
  const place = autocomplete.getPlace();
  let address1 = "";
  let postcode = "";
  
  if (place.geometry && place.geometry.location) {
    document.querySelector("#estate_latitude").value = place.geometry.location.lat();
    document.querySelector("#estate_longitude").value = place.geometry.location.lng();
  }

  for (const component of place.address_components) {
    const componentType = component.types[0];
    switch (componentType) {
      case "street_number": {
        address1 = `${component.long_name} ${address1}`;
        break;
      }

      case "route": {
        address1 += component.short_name;
        break;
      }

      case "postal_code": {
        postcode = `${component.long_name}${postcode}`;
        break;
      }

      case "postal_code_suffix": {
        postcode = `${postcode}-${component.long_name}`;
        break;
      }

      case "locality": {
        document.querySelector("#estate_city").value = component.long_name;
        break;
      }

      case "country": {
        document.querySelector("#estate_country").value = component.long_name;
        break;
      }
    }
  }

  address1Field.value = address1;
  postalField.value = postcode;
}
