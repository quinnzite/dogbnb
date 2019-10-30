import flatpickr from "flatpickr";


const initFlatpickr = () => {
  const  startDate = document.querySelector("#fostering_start_date")
  const  endDate = document.querySelector("#fostering_end_date")
  if (startDate) {
    flatpickr(startDate, { mode: "range", inline: true })
    flatpickr(endDate)
  }
}

export { initFlatpickr };
