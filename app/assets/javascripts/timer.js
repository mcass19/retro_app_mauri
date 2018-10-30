function executeTimer() {
  let timerToShow = $('#counter');
  let seconds = minutes = minutesToPrint = secondsToPrint = 0;
  count = setInterval(() => {
    seconds++;
    if (seconds === 60) {
      minutes++;
      seconds = 0;
    }
    if (minutes < 10) {
      minutesToPrint = '0' + minutes;
    } else {
      minutesToPrint = minutes;
    }
    if (seconds < 10) {
      secondsToPrint = '0' + seconds;
    } else {
      secondsToPrint = seconds;
    }
    timerToShow.text(minutesToPrint + ':' + secondsToPrint);
    if (minutes === 50) {
      timerToShow.addClass("last_minutes");
    }
    if (minutes === 60) {
      clearInterval(count);
    }
  }, 1000);
};
