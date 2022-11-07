
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<c:url value="/css/upload_routes.css"/>">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
    integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <title>Upload Route</title>
</head>

<body>
  <div class="ct color">
    <div class="container">
      <div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">
        <div class="img-left d-none d-md-flex"></div>
    <div class="container-upload upload-trans">
      <div class="body-header">
        <h4 class="title-header text-left ml-4">
          Thanh Buoi Bus
        </h4>
      </div>
      <header class="header-upload">Upload Form</header>
      <div class="progress-upload">
        <div class="step">
          <p>
            Route
          </p>
          <div class="bullet">
            <span>1</span>
          </div>
          <div class="check fas fa-check"></div>
        </div>
        <div class="step">
          <p>
            Type
          </p>
          <div class="bullet">
            <span>2</span>
          </div>
          <div class="check fas fa-check"></div>
        </div>
        <div class="step">
          <p>
            Time
          </p>
          <div class="bullet">
            <span>3</span>
          </div>
          <div class="check fas fa-check"></div>
        </div>
        <div class="step">
          <p>
            Station
          </p>
          <div class="bullet">
            <span>4</span>
          </div>
          <div class="check fas fa-check"></div>
        </div>
      </div>
      <div class="form-outer">
        <form action="#">
          <div class="page slide-page">
            <div class="title">
              Select Route:
            </div>
            <div class="field-form">
              <div class="label">
                From
              </div>
              <div class="select-from">
                <select name="format" id="format">
                  <option selected disabled>Choose Departure</option>
                  <option value="hcm"> Ho Chi Minh City</option>
                  <option value="dalat">Da Lat, Lam Dong</option>
                  <option value="cantho">Can Tho</option>
                  <option value="danang">Da Nang</option>
                </select>
              </div>
            </div>
            <div class="field-form">
              <div class="label">
                To
              </div>
              <div class="select-from">
                <select name="format" id="format">
                  <option selected disabled>Choose Departure</option>
                  <option value="hcm"> Ho Chi Minh City</option>
                  <option value="dalat">Da Lat, Lam Dong</option>
                  <option value="cantho">Can Tho</option>
                  <option value="danang">Da Nang</option>
                </select>
              </div>
            </div>
            <div class="field-btn">
              <button class="firstNext next">Next</button>
            </div>
          </div>
          <div class="page">
            <div class="title">
              Bus Type:
            </div>
            <div class="field-type">
              <div class="label">
                <input type="radio" id="47-seats" name="type-bus" class="cheked-typed" />
                <label class="input-check" for="47-seats"> 47 Seats</label>

                <input type="radio" id="sleeper-bus" name="type-bus" class="cheked-typed" />
                <label class="input-check" for="sleeper-bus"> Sleeper Bus</label>

                <input type="radio" id="sleeper-room-bus" name="type-bus" class="cheked-typed" />
                <label class="input-check" for="sleeper-room-bus">Sleeper Room Bus</label>
              </div>
            </div>
            <div class="title">
              Cost:
            </div>
            <div class="field-type">
              <div class="label">
                <input class="form-control" type="text" name="currency-field" id="currency-field"
                  pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" data-type="currency" placeholder="100.000 VND">
              </div>
            </div>
            <div class="field-btn btns">
              <button class="prev-1 prev">Previous</button>
              <button class="next-1 next">Next</button>
            </div>
          </div>
          <div class="page">
            <div class="title">
              Pickup Time:
            </div>
            <div class="field-form">
              <div class="label">
                <input class="form-control" type="datetime-local">
              </div>
            </div>
            <div class="field-btn btns">
              <button class="prev-2 prev">Previous</button>
              <button class="next-2 next">Next</button>
            </div>
          </div>

          <div class="page">
            <div class="title">
              Station:
            </div>
            <div class="field-form">
              <div class="label">
                Pickup Point
              </div>
              <div class="input-wrap">
                <input type="text" minlength="4" class="input-field" autocomplete="off" required="required"
                  id="pickup-point" />
                <label for="fullname">Pickup Point</label>

              </div>
            </div>
            <div class="field-form">
              <div class="label drop">
                Drop Point
              </div>
              <div class="input-wrap">
                <input type="text" minlength="4" class="input-field" autocomplete="off" required="required"
                  id="drop-point" />
                <label for="fullname">Drop Point</label>

              </div>
            </div>
            <div class="field-btn btns">
              <button class="prev-3 prev">Previous</button>
              <button class="submit">Upload</button>
            </div>
          </div>
        </form>
      </div>
      <div id="pop-up" class="pop-up-noti">
        <div class="popup center">
          <div class="icon">
            <i class="fa fa-check" aria-hidden="true"></i>
          </div>
          <div class="title-check">Uploading Successfully!</div>
          <div class="dismiss-btn">
            <button id="ok" class="ok">Ok</button>
          </div>
        </div>
      </div>
      <div id="pop-up" class="pop-up-noti">
        <div class="popup-ques center">
          <div class="title-check">Are you sure to upload this bus? </div>
          <div class="dismiss-btn">
            <button id="yes">Yes</button>
            <button id="no">No</button>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</div>
  
  <script src="<c:url value="/js/upload_routes.js"/>"></script>
  <script type="text/javascript">
    $("input[data-type='currency']").on({
        keyup: function () {
            formatCurrency($(this));
        },
        blur: function () {
            formatCurrency($(this), "blur");
        }
    });


    function formatNumber(n) {
        // format number 1000000 to 1,234,567
        return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    }


    function formatCurrency(input, blur) {
        // appends $ to value, validates decimal side
        // and puts cursor back in right position.

        // get input value
        var input_val = input.val();

        // don't validate empty input
        if (input_val === "") { return; }

        // original length
        var original_len = input_val.length;

        // initial caret position 
        var caret_pos = input.prop("selectionStart");

        // check for decimal
        if (input_val.indexOf(".") >= 0) {

            // get position of first decimal
            // this prevents multiple decimals from
            // being entered
            var decimal_pos = input_val.indexOf(".");

            // split number by decimal point
            var left_side = input_val.substring(0, decimal_pos);
            var right_side = input_val.substring(decimal_pos);

            // add commas to left side of number
            left_side = formatNumber(left_side);

            // validate right side
            right_side = formatNumber(right_side);

            // On blur make sure 2 numbers after decimal
            if (blur === "blur") {
                right_side;
            }

            // Limit decimal to only 2 digits
            right_side = right_side.substring(0, 2);

            // join number by .
            input_val = left_side + "." + right_side + " VND";

        } else {
            // no decimal entered
            // add commas to number
            // remove all non-digits
            input_val = formatNumber(input_val);


            // final formatting
            if (blur === "blur") {
                input_val = input_val + " VND";
            }
        }

        // send updated string to input
        input.val(input_val);

        // put caret back in the right position
        var updated_len = input_val.length;
        caret_pos = updated_len - original_len + caret_pos;
        input[0].setSelectionRange(caret_pos, caret_pos);
    }
</script>
</body>

</html>