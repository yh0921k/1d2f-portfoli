<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<div id="middle" class="flex-fill">
  <section class="rounded mb-3 min-h-75vh">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">Admin
      index</div>
    <!-- WIDGETS -->
    <div class="row gutters-sm">

      <div class="col-12 col-md-6 col-xl-3 mb-3">

        <!-- small graph widget -->
        <div class="bg-white shadow-md text-dark p-5 rounded text-center">

          <span
            class="badge badge-light fs--45 w--100 h--100 badge-pill rounded-circle">
            <i class="fi fi-user-plus mt-1"></i>
          </span>

          <h3 class="fs--20 mt-5">New Members</h3>

          <p>Last 30 days</p>

          <div class="position-relative max-h-200">
            <canvas class="chartjs" data-chartjs-dots="false"
              data-chartjs-legend="false" data-chartjs-grid="false"
              data-chartjs-tooltip="true" data-chartjs-line-width="3"
              data-chartjs-type="line"
              data-chartjs-labels='["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]'
              data-chartjs-datasets='[{                                                           
                          "label":                    "Customers",
                          "data":                     ${newMemberCountForAMonth},
                          "fill":                     false,
                          "backgroundColor":          "rgba(255, 159, 64, 1)"
                      }]'></canvas>
          </div>

        </div>
        <!-- /small graph widget -->

      </div>

    <div class="col-12 col-md-6 col-xl-3 mb-3">

      <!-- small graph widget -->
      <div class="bg-white shadow-md text-dark p-5 rounded text-center">

        <span
          class="badge badge-light fs--45 w--100 h--100 badge-pill rounded-circle">
          <i class="fi fi-home mt-1"></i>
        </span>

        <h3 class="fs--20 mt-5">Monthly Visits</h3>

        <p>Last 30 days</p>

        <div class="position-relative max-h-200">
          <canvas class="chartjs" data-chartjs-dots="false"
            data-chartjs-legend="false" data-chartjs-grid="false"
            data-chartjs-tooltip="true" data-chartjs-line-width="3"
            data-chartjs-type="line"
            data-chartjs-labels='["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]'
            data-chartjs-datasets='[{                                                           
                          "label":                    "Orders",
                          "data":                     [11, 11, 17, 11, 15, 12, 13, 16, 11, 18, 20, 21],
                          "fill":                     false,
                          "backgroundColor":          "rgba(54, 162, 235, 1)"
                      }]'></canvas>
        </div>

      </div>
      <!-- /small graph widget -->

    </div>

    <div class="col-12 col-xl-6 mb-3">
      <div class="portlet">

        <div class="portlet-header">

          <div class="float-end dropdown">

            <!-- dropdown -->
            <button type="button"
              class="dropdown-toggle btn btn-sm btn-soft btn-primary px-2 py-1 fs--15 mt--n3"
              id="dropdownGraph1" data-toggle="dropdown" aria-haspopup="true"
              aria-expanded="false">
              <i class="fi fi-dots-vertical m-0"></i>
            </button>

            <div
              class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-invert mt-2"
              aria-labelledby="dropdownGraph1">

              <div class="dropdown-header">Export Options</div>

              <a href="#!" class="dropdown-item"> Export CSV </a> <a href="#!"
                class="dropdown-item"> Export XLS </a> <a href="#!"
                class="dropdown-item"> Export PDF </a> <a href="#!"
                class="dropdown-item"> Print </a>

            </div>
            <!-- /dropdown -->

          </div>

          <span class="d-block text-muted text-truncate font-weight-medium">
            Monthly Conversions </span>
        </div>

        <div
          class="portlet-body max-h-500 scrollable-vertical scrollable-styled-dark tab-content">


          <div class="position-relative min-h-250 max-h-300-xs h-100">
            <canvas class="chartjs" data-chartjs-dots="false"
              data-chartjs-legend="false" data-chartjs-grid="true"
              data-chartjs-tooltip="true" data-chartjs-line-width="3"
              data-chartjs-type="line"
              data-chartjs-labels='["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]'
              data-chartjs-datasets='[{                                                           
                          "label":                    "Orders",
                          "data":                     [11, 11, 17, 11, 15, 12, 13, 16, 11, 18, 20, 21],
                          "fill":                     true,
                          "backgroundColor":          "rgba(201, 203, 207, 0.3)",
                          "borderColor":        "rgba(255, 99, 132, 1)",
                          "borderWidth": 1
                      }]'></canvas>
          </div>
        </div>
      </div>
    </div>
    </div>
    <!-- /WIDGETS -->
  </section>
</div>