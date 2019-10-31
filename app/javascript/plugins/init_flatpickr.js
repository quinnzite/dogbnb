import flatpickr from "flatpickr";


const initFlatpickr = () => {
  const  startDate = document.querySelector("#fostering_start_date")

  if (startDate) {
    const unavailableDates = JSON.parse(document.querySelector('#dog-booking-dates').dataset.unavailable)
    const availableDate = JSON.parse(document.querySelector('#dog-booking-dates').dataset.firstAvailable)
    console.log(availableDate)
    const endDates = []

    flatpickr(startDate, {
    mode: "range",
    inline: true,
    minDate: availableDate,
    altInput: true,
    altFormat: "F j, Y",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  })
  }
}

export { initFlatpickr };
