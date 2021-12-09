# frozen_string_literal: true

class PropertyManager::DashboardController < ApplicationController
  layout "dashboard"

  def index
    @outstanding_payments = [
      {
        payee: "Brian Kenny",
        estate: "Vesta Two-Three North",
        unit: "Apartment No. 234",
        amount_due: "€840.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Andrew McDonagh",
        estate: "Marianella",
        unit: "Apartment No. 123",
        amount_due: "€1,300.00",
        due_date: "17 November 2021",
        is_reminder_sent: true
      },
      {
        payee: "Clark Wickstone",
        estate: "WeLive",
        unit: "Town House No. 001",
        amount_due: "€1,700.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Brian Kenny",
        estate: "Vesta Two-Three North",
        unit: "Apartment No. 234",
        amount_due: "€840.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Andrew McDonagh",
        estate: "Marianella",
        unit: "Apartment No. 123",
        amount_due: "€1,300.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Clark Wickstone",
        estate: "WeLive",
        unit: "Town House No. 001",
        amount_due: "€1,700.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Clark Wickstone",
        estate: "WeLive",
        unit: "Town House No. 001",
        amount_due: "€1,700.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Brian Kenny",
        estate: "Vesta Two-Three North",
        unit: "Apartment No. 234",
        amount_due: "€840.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Andrew McDonagh",
        estate: "Marianella",
        unit: "Apartment No. 123",
        amount_due: "€1,300.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
      {
        payee: "Clark Wickstone",
        estate: "WeLive",
        unit: "Town House No. 001",
        amount_due: "€1,700.00",
        due_date: "17 November 2021",
        is_reminder_sent: false
      },
    ]
  end
end
