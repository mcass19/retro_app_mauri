function executeTimer() {
  let timerToShow = $('#counter');
  let seconds = minutes = minutesToPrint = secondsToPrint = 0;
  const count = setInterval(() => {
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
      timerToShow.removeClass("timer").addClass("timer last-minutes");
    }
    if (minutes === 60) {
      clearInterval(count);
    }
  }, 1000);
};
