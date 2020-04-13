<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8" />
    <title>Portfoli</title>
    <meta name="description" content="...">

        <meta name="viewport" content="width=device-width, maximum-scale=5, initial-scale=1, user-scalable=0">
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

        <!-- up to 10% speed up for external res -->
        <link rel="dns-prefetch" href="https://fonts.googleapis.com/">
        <link rel="dns-prefetch" href="https://fonts.gstatic.com/">
        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <!-- preloading icon font is helping to speed up a little bit -->
        <link rel="preload" href="../resources/assets/fonts/flaticon/Flaticon.woff2" as="font" type="font/woff2" crossorigin>

        <link rel="stylesheet" href="../resources/assets/css/core.min.css">
        <link rel="stylesheet" href="../resources/assets/css/vendor_bundle.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;display=swap">

    <!-- favicon -->
    <link rel="shortcut icon" href="../favicon.ico">
    <link rel="apple-touch-icon" href="demo.files/logo/icon_512x512.png">

    <link rel="manifest" href="../resources/assets/images/manifest/manifest.json">
    <meta name="theme-color" content="#377dff">

  </head>

  <!--

    Available Body Classes
      .layout-boxed           - boxed layout (ignored if any .header-* class is present)

      .header-scroll-reveal       - header : hide on scroll down and reveal on scroll up
      .header-sticky          - header : always visible on top
      .header-over            - header : over slider|parallax|image (next section must contain a large image, else will be indistinguishable)

        Possible header combinations:
          .header-over + .header-scroll-reveal
          .header-over + .header-sticky
            * NOTE: if .header-sticky + .header-scroll-reveal are both used, .header-scroll-reveal is ignored


      .bg-cover .bg-fixed       - both classes used with .layout-boxed to set a background image via style="background-image:url(...)"
  -->
  <body class="header-sticky">

    <div id="wrapper">


      <!-- HEADER -->
      <header id="header" class="shadow-xs bg-gradient-dark">

        <!-- TOP BAR -->
        <div id="top_bar" class="bg-gradient-dark fs--14"> <!-- optional if body.header-sticky is present: add .js-ignore class to ignore autohide and stay visible all the time -->
          <div class="container">

            <div class="text-nowrap"><!-- change with .scrollable-horizontal to horizontally scroll, if -only- no dropdown is present -->
              <div class="d-flex justify-content-between">

                <div class="d-inline-block float-start">
                  <ul class="list-inline m-0">

                    <!-- LANGUAGE -->
                    <li class="dropdown list-inline-item m-0">

                      <a id="topDDLanguage" href="#!" class="py-2 d-inline-block" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
                        <i class="flag flag-us"></i> 
                        <span class="fs--14 text-white pl-2 pr-2">ENGLISH</span>
                      </a>

                      <div aria-labelledby="topDDLanguage" class="dropdown-menu dropdown-menu-hover text-uppercase fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh scrollable-vertical">
                        <a href="#!" class="active dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
                          <i class="flag flag-us"></i> 
                          ENGLISH
                        </a>
                        <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
                          <i class="flag flag-de"></i> 
                          GERMAN
                        </a>
                        <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded p--12 mb-1">
                          <i class="flag flag-fr"></i> 
                          FRANCAISE
                        </a>
                      </div>

                    </li>
                    <!-- /LANGUAGE -->


                    <!-- CURRENCY -->
                    <li class="dropdown list-inline-item m-0">

                      <span class="text-white">/</span><!-- optional separator -->

                      <a id="topDDCurrency" href="#" class="py-2 d-inline-block" data-toggle="dropdown" aria-expanded="false">
                        <span class="fs--14 text-white pl-2 pr-2">USD</span>
                      </a>

                      <div aria-labelledby="topDDCurrency" class="dropdown-menu dropdown-menu-hover text-uppercase text-center fs--13 px-1 pt-1 pb-0 m-0 max-h-50vh w-auto scrollable-vertical">
                        <a href="#!" class="active dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
                          USD
                        </a>
                        <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
                          EUR
                        </a>
                        <a href="#!" class="dropdown-item text-muted text-truncate line-height-1 rounded pt--12 pb--12 mb-1">
                          GBP
                        </a>
                      </div>

                    </li>
                    <!-- /CURRENCY -->

                  </ul>
                </div>


              <!--  <div class="d-inline-block float-end">

                  <ul class="list-inline m-0">

                    <li class="dropdown list-inline-item">

                      <a href="tel:+01-555-5555" class="fs--14 p-2 d-inline-block font-weight-medium text-white">
                        <i class="float-start fi fi-phone"></i> (+01) 555-5555
                      </a>

                    </li>

                  </ul>

                </div>   -->

              </div>
            </div>

          </div>
        </div>
        <!-- /TOP BAR -->




        <!-- NAVBAR -->
        <div class="container position-relative">


          <!-- 

            [SOW] SEARCH SUGGEST PLUGIN
            ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++
            PLEASE READ DOCUMENTATION
            documentation/plugins-sow-search-suggest.html
            ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++ ++

          -->
          <form   action="search-result-2.html" 
              method="GET" 
              data-autosuggest="on" 

              data-mode="json" 
              data-json-max-results='10'
              data-json-related-title='Explore Smarty'
              data-json-related-item-icon='fi fi-star-empty'
              data-json-suggest-title='Suggestions for you'
              data-json-suggest-noresult='No results for'
              data-json-suggest-item-icon='fi fi-search'
              data-json-suggest-min-score='5'
              data-json-highlight-term='true'
              data-contentType='application/json; charset=utf-8'
              data-dataType='json'

              data-container="#sow-search-container" 
              data-input-min-length="2" 
              data-input-delay="250" 
              data-related-keywords="" 
              data-related-url="_ajax/search_suggest_related.json" 
              data-suggest-url="_ajax/search_suggest_input.json" 
              data-related-action="related_get" 
              data-suggest-action="suggest_get" 
              class="js-ajax-search sow-search sow-search-over hide d-inline-flex">
            <div class="sow-search-input w-100">

              <div class="input-group-over d-flex align-items-center w-100 h-100 rounded shadow-md">

                <input placeholder="what are you looking today?" aria-label="what are you looking today?" name="s" type="text" class="form-control-sow-search form-control form-control-lg shadow-xs" value="" autocomplete="off">

                <span class="sow-search-buttons">

                  <!-- search button -->
                  <button aria-label="Global Search" type="submit" class="btn bg-transparent shadow-none m-0 px-2 py-1 text-muted">
                    <i class="fi fi-search fs--20"></i>
                  </button>

                  <!-- close : mobile only (d-inline-block d-lg-none) -->
                  <a href="javascript:;" class="btn-sow-search-toggler btn btn-light shadow-none m-0 px-2 py-1 d-inline-block d-lg-none">
                    <i class="fi fi-close fs--20"></i>
                  </a>

                </span>

              </div>

            </div>

            <!-- search suggestion container -->
            <div class="sow-search-container w-100 p-0 hide shadow-md" id="sow-search-container">
              <div class="sow-search-container-wrapper">

                <!-- main search container -->
                <div class="sow-search-loader p-3 text-center hide">
                  <i class="fi fi-circle-spin fi-spin text-muted fs--30"></i>
                </div>

                <!-- 
                  AJAX CONTENT CONTAINER 
                  SHOULD ALWAYS BE AS IT IS : NO COMMENTS OR EVEN SPACES!
                --><div class="sow-search-content rounded w-100 scrollable-vertical"></div>

              </div>
            </div>
            <!-- /search suggestion container -->

            <!-- 

              overlay combinations:
                overlay-dark opacity-* [1-9]
                overlay-light opacity-* [1-9]

            -->
            <div class="sow-search-backdrop overlay-dark opacity-3 hide"></div>

          </form>
          <!-- /SEARCH -->





          <nav class="navbar navbar-expand-lg navbar-dark text-white justify-content-lg-between justify-content-md-inherit">

            <div class="align-items-start">

              <!-- mobile menu button : show -->
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMainNav" aria-controls="navbarMainNav" aria-expanded="false" aria-label="Toggle navigation">
                <svg width="25" viewBox="0 0 20 20">
                  <path fill="#fff" d="M 19.9876 1.998 L -0.0108 1.998 L -0.0108 -0.0019 L 19.9876 -0.0019 L 19.9876 1.998 Z"></path>
                  <path fill="#fff" d="M 19.9876 7.9979 L -0.0108 7.9979 L -0.0108 5.9979 L 19.9876 5.9979 L 19.9876 7.9979 Z"></path>
                  <path fill="#fff" d="M 19.9876 13.9977 L -0.0108 13.9977 L -0.0108 11.9978 L 19.9876 11.9978 L 19.9876 13.9977 Z"></path>
                  <path fill="#fff" d="M 19.9876 19.9976 L -0.0108 19.9976 L -0.0108 17.9976 L 19.9876 17.9976 L 19.9876 19.9976 Z"></path>
                </svg>
              </button>

              <!-- 
                Logo : height: 70px max
              -->
              <a class="navbar-brand" href="index.html">
                <img src="../resources/assets/images/logo/logo_light.svg" width="110" height="70" alt="...">
              </a>

            </div>




            <!-- Menu -->
            <!--

              Dropdown Classes (should be added to primary .dropdown-menu only, dropdown childs are also affected)
                .dropdown-menu-dark     - dark dropdown (desktop only, will be white on mobile)
                .dropdown-menu-hover    - open on hover
                .dropdown-menu-clean    - no background color on hover
                .dropdown-menu-invert     - open dropdown in oposite direction (left|right, according to RTL|LTR)
                .dropdown-menu-uppercase  - uppercase text (font-size is scalled down to 13px)
                .dropdown-click-ignore    - keep dropdown open on inside click (useful on forms inside dropdown)

                Repositioning long dropdown childs (Example: Pages->Account)
                  .dropdown-menu-up-n100    - open up with top: -100px
                  .dropdown-menu-up-n100    - open up with top: -150px
                  .dropdown-menu-up-n180    - open up with top: -180px
                  .dropdown-menu-up-n220    - open up with top: -220px
                  .dropdown-menu-up-n250    - open up with top: -250px
                  .dropdown-menu-up       - open up without negative class


                Dropdown prefix icon (optional, if enabled in variables.scss)
                  .prefix-link-icon .prefix-icon-dot    - link prefix
                  .prefix-link-icon .prefix-icon-line   - link prefix
                  .prefix-link-icon .prefix-icon-ico    - link prefix
                  .prefix-link-icon .prefix-icon-arrow  - link prefix

                .nav-link.nav-link-caret-hide   - no dropdown icon indicator on main link
                .nav-item.dropdown-mega     - required ONLY on fullwidth mega menu

                Mobile animation - add to .navbar-collapse:
                .navbar-animate-fadein
                .navbar-animate-bouncein

            -->
            <div class="collapse navbar-collapse navbar-animate-fadein" id="navbarMainNav">


              <!-- MOBILE MENU NAVBAR -->
              <div class="navbar-xs d-none"><!-- .sticky-top -->

                <!-- mobile menu button : close -->
                <button class="navbar-toggler pt-0" type="button" data-toggle="collapse" data-target="#navbarMainNav" aria-controls="navbarMainNav" aria-expanded="false" aria-label="Toggle navigation">
                  <svg width="20" viewBox="0 0 20 20">
                    <path d="M 20.7895 0.977 L 19.3752 -0.4364 L 10.081 8.8522 L 0.7869 -0.4364 L -0.6274 0.977 L 8.6668 10.2656 L -0.6274 19.5542 L 0.7869 20.9676 L 10.081 11.679 L 19.3752 20.9676 L 20.7895 19.5542 L 11.4953 10.2656 L 20.7895 0.977 Z"></path>
                  </svg>
                </button>

                <!-- 
                  Mobile Menu Logo 
                  Logo : height: 70px max
                -->
                <a class="navbar-brand" href="index.html">
                  <img src="../resources/assets/images/logo/logo_dark.svg" width="110" height="70" alt="...">
                </a>

              </div>
              <!-- /MOBILE MENU NAVBAR -->



              <!-- NAVIGATION -->
              <ul class="navbar-nav">
                <!-- Menu -->
                <!--

                  Dropdown Classes (should be added to primary .dropdown-menu only, dropdown childs are also affected)
                    .dropdown-menu-dark     - dark dropdown (desktop only, will be white on mobile)
                    .dropdown-menu-hover    - open on hover
                    .dropdown-menu-clean    - no background color on hover
                    .dropdown-menu-invert     - open dropdown in oposite direction (left|right, according to RTL|LTR)
                    .dropdown-menu-uppercase  - uppercase text (font-size is scalled down to 13px)
                    .dropdown-click-ignore    - keep dropdown open on inside click (useful on forms inside dropdown)

                    Repositioning long dropdown childs (Example: Pages->Account)
                      .dropdown-menu-up-n100    - open up with top: -100px
                      .dropdown-menu-up-n100    - open up with top: -150px
                      .dropdown-menu-up-n180    - open up with top: -180px
                      .dropdown-menu-up-n220    - open up with top: -220px
                      .dropdown-menu-up-n250    - open up with top: -250px
                      .dropdown-menu-up       - open up without negative class


                    Dropdown prefix icon (optional, if enabled in variables.scss)
                      .prefix-link-icon .prefix-icon-dot    - link prefix
                      .prefix-link-icon .prefix-icon-line   - link prefix
                      .prefix-link-icon .prefix-icon-ico    - link prefix
                      .prefix-link-icon .prefix-icon-arrow  - link prefix

                    .nav-link.nav-link-caret-hide   - no dropdown icon indicator on main link
                    .nav-item.dropdown-mega     - required ONLY on fullwidth mega menu

                    Mobile animation - add to .navbar-collapse:
                    .navbar-animate-fadein
                    .navbar-animate-bouncein

                -->
                <!-- mobile only image + simple search (d-block d-sm-none) -->
                <li class="nav-item d-block d-sm-none">

                  <!-- image -->
                  <div class="mb-4">
                    <img width="600" height="600" class="img-fluid" src="demo.files/svg/artworks/people_crossbrowser.svg" alt="...">
                  </div>

                  <!-- search -->
                  <form method="get" action="#!search" class="input-group-over mb-5 bg-light p-2 form-control-pill">
                    <input type="text" name="keyword" value="" placeholder="Quick search..." class="form-control border-dashed">
                    <button class="btn btn-primary btn-ghost fi fi-search p-0 ml-2 mr-2 w--50 h--50"></button>
                  </form>

                </li>


                <!-- home -->
                <li class="nav-item dropdown active">

                  <a href="#" id="mainNavHome" class="nav-link dropdown-toggle" 
                    data-toggle="dropdown" 
                    aria-haspopup="true" 
                    aria-expanded="false">
                    Home
                  </a>

                  <div aria-labelledby="mainNavHome" class="dropdown-menu dropdown-menu-clean dropdown-menu-dark dropdown-menu-hover">
                      <ul class="list-unstyled m-0 p-0">
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Home Landing</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="landing-1.html" class="dropdown-link">Landing 1</a></li>
                                  <li class="dropdown-item"><a href="landing-2.html" class="dropdown-link">Landing 2</a></li>
                                  <li class="dropdown-item"><a href="landing-3.html" class="dropdown-link">Landing 3</a></li>
                                  <li class="dropdown-item"><a href="landing-4.html" class="dropdown-link">Landing 4</a></li>
                                  <li class="dropdown-item"><a href="landing-5.html" class="dropdown-link">Landing 5</a></li>
                                  <li class="dropdown-item"><a href="landing-6.html" class="dropdown-link">Landing 6</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Niche</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="niche.classifieds.html" class="dropdown-link">Classifieds</a></li>
                                  <li class="dropdown-item"><a href="niche.realestate.html" class="dropdown-link">Real Estate</a></li>
                                  <li class="dropdown-item"><a href="niche.restaurant.html" class="dropdown-link">Restaurant</a></li>
                                  <li class="dropdown-item"><a href="niche.caffe.html" class="dropdown-link">Caffe</a></li>
                                  <li class="dropdown-item"><a href="niche.lawyer.html" class="dropdown-link">Lawyer</a></li>
                                  <li class="dropdown-item"><a href="niche.tattoo.html" class="dropdown-link">Tattoo</a></li>
                                  <li class="dropdown-item"><a href="niche.hosting.html" class="dropdown-link">Hosting</a></li>
                                  <li class="dropdown-item"><a href="#" class="dropdown-link disabled">More : Soon</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item"><a href="help-center-1-index.html" class="dropdown-link">Help Center 1</a></li>
                          <li class="dropdown-item"><a href="help-center-2-index.html" class="dropdown-link">Help Center 2</a></li>
                          <li class="dropdown-item"><a href="fullajax-index.html" class="dropdown-link" target="_blank">Full Ajax</a></li>
                          <li class="dropdown-divider"></li>
                          <li class="dropdown-item"><a href="https://theme.stepofweb.com/Smarty/v2.3.1/HTML_BS4/start_v4.html" class="dropdown-link" target="_blank">Smarty v2.x <i class="fi fi-emoji-smile text-muted"></i> <span class="d-block text-muted pt--6 fs--13 font-weight-light">You also get previous <br> Smarty version. Eh?</span></a></li>
                      </ul>
                  </div>

                </li>


                <!-- pages -->
                <li class="nav-item dropdown">

                  <a href="#" id="mainNavPages" class="nav-link dropdown-toggle" 
                    data-toggle="dropdown" 
                    aria-haspopup="true" 
                    aria-expanded="false">
                    Pages
                  </a>

                  <div aria-labelledby="mainNavPages" class="dropdown-menu dropdown-menu-clean dropdown-menu-dark dropdown-menu-hover">
                      <ul class="list-unstyled m-0 p-0">
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">About</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="about-us-1.html" class="dropdown-link">About Us 1</a></li>
                                  <li class="dropdown-item"><a href="about-us-2.html" class="dropdown-link">About Us 2</a></li>
                                  <li class="dropdown-item"><a href="about-us-3.html" class="dropdown-link">About Us 3</a></li>
                                  <li class="dropdown-item"><a href="about-us-4.html" class="dropdown-link">About Us 4</a></li>
                                  <li class="dropdown-item"><a href="about-us-5.html" class="dropdown-link">About Us 5</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="about-me-1.html" class="dropdown-link">About Me 1</a></li>
                                  <li class="dropdown-item"><a href="about-me-2.html" class="dropdown-link">About Me 2</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Services</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="services-1.html" class="dropdown-link">Services 1</a></li>
                                  <li class="dropdown-item"><a href="services-2.html" class="dropdown-link">Services 2</a></li>
                                  <li class="dropdown-item"><a href="services-3.html" class="dropdown-link">Services 3</a></li>
                                  <li class="dropdown-item"><a href="services-4.html" class="dropdown-link">Services 4</a></li>
                                  <li class="dropdown-item"><a href="services-5.html" class="dropdown-link">Services 5</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Contact</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="contact-1.html" class="dropdown-link">Contact 1</a></li>
                                  <li class="dropdown-item"><a href="contact-2.html" class="dropdown-link">Contact 2</a></li>
                                  <li class="dropdown-item"><a href="contact-3.html" class="dropdown-link">Contact 3</a></li>
                                  <li class="dropdown-item"><a href="contact-4.html" class="dropdown-link">Contact 4</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Pricing</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="pricing-1.html" class="dropdown-link">Pricing 1</a></li>
                                  <li class="dropdown-item"><a href="pricing-2.html" class="dropdown-link">Pricing 2</a></li>
                                  <li class="dropdown-item"><a href="pricing-3.html" class="dropdown-link">Pricing 3</a></li>
                                  <li class="dropdown-item"><a href="pricing-4.html" class="dropdown-link">Pricing 4</a></li>
                                  <li class="dropdown-item"><a href="pricing-5.html" class="dropdown-link">Pricing 5</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">FAQ</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="faq-1.html" class="dropdown-link">FAQ 1</a></li>
                                  <li class="dropdown-item"><a href="faq-2.html" class="dropdown-link">FAQ 2</a></li>
                                  <li class="dropdown-item"><a href="faq-3.html" class="dropdown-link">FAQ 3</a></li>
                                  <li class="dropdown-item"><a href="faq-4.html" class="dropdown-link">FAQ 4</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Team</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="team-1.html" class="dropdown-link">Team 1</a></li>
                                  <li class="dropdown-item"><a href="team-2.html" class="dropdown-link">Team 2</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Account</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="account-full-signin-1.html" class="dropdown-link">Sign In/Up : Full 1</a></li>
                                  <li class="dropdown-item"><a href="account-full-signin-2.html" class="dropdown-link">Sign In/Up : Full 2</a></li>
                                  <li class="dropdown-item"><a href="account-onepage-signin.html" class="dropdown-link">Sign In/Up : Onepage</a></li>
                                  <li class="dropdown-item"><a href="account-simple-signin.html" class="dropdown-link">Sign In/Up : Simple</a></li>
                                  <li class="dropdown-item"><a href="account-modal-signin.html" class="dropdown-link">Sign In/Up : Modal</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="account-orders.html" class="dropdown-link">Account : Orders</a></li>
                                  <li class="dropdown-item"><a href="account-favourites.html" class="dropdown-link">Account : Favourites</a></li>
                                  <li class="dropdown-item"><a href="account-settings.html" class="dropdown-link">Account : Settings</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Clients / Career</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="clients.html" class="dropdown-link">Clients</a></li>
                                  <li class="dropdown-item"><a href="career.html" class="dropdown-link">Career</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Portfolio</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="portfolio-columns-2.html" class="dropdown-link">2 Columns</a></li>
                                  <li class="dropdown-item"><a href="portfolio-columns-3.html" class="dropdown-link">3 Columns</a></li>
                                  <li class="dropdown-item"><a href="portfolio-columns-4.html" class="dropdown-link">4 Columns</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="portfolio-single-1.html" class="dropdown-link">Single Item 1</a></li>
                                  <li class="dropdown-item"><a href="portfolio-single-2.html" class="dropdown-link">Single Item 2</a></li>
                                  <li class="dropdown-item"><a href="portfolio-single-3.html" class="dropdown-link">Single Item 3</a></li>
                                  <li class="dropdown-item"><a href="portfolio-single-4.html" class="dropdown-link">Single Item 4</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Search Result</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="search-result-1.html" class="dropdown-link">Search Result 1</a></li>
                                  <li class="dropdown-item"><a href="search-result-2.html" class="dropdown-link">Search Result 2</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item">
                            <a href="forum-index.html" class="dropdown-link">Forum / Comunity</a>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Utility</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-up dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="404-1.html" class="dropdown-link">Error 1</a></li>
                                  <li class="dropdown-item"><a href="404-2.html" class="dropdown-link">Error 2</a></li>
                                  <li class="dropdown-item"><a href="404-3.html" class="dropdown-link">Error 3</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="maintenance-1.html" class="dropdown-link">Maintenance 1</a></li>
                                  <li class="dropdown-item"><a href="maintenance-2.html" class="dropdown-link">Maintenance 2</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="comingsoon-1.html" class="dropdown-link">Coming Soon 1</a></li>
                                  <li class="dropdown-item"><a href="comingsoon-2.html" class="dropdown-link">Coming Soon 2</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="page-cookie.html" class="dropdown-link">GDPR Page &amp; Cookie Window</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-divider"></li>
                          <li class="dropdown-item"><a href="__junkyard.html" class="dropdown-link text-gray-500" target="smarty">Smarty Junkyard</a></li>
                      </ul>
                  </div>

                </li>


                <!-- features -->
                <li class="nav-item dropdown">

                  <a href="#" id="mainNavFeatures" class="nav-link dropdown-toggle" 
                    data-toggle="dropdown" 
                    aria-haspopup="true" 
                    aria-expanded="false">
                    Features
                  </a>

                  <div aria-labelledby="mainNavFeatures" class="dropdown-menu dropdown-menu-clean dropdown-menu-dark dropdown-menu-hover">
                      <ul class="list-unstyled m-0 p-0">
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Header</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item dropdown"><a href="#" class="dropdown-link font-weight-bold" data-toggle="dropdown">Variants</a>
                                      <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                          <li class="dropdown-item"><a href="header-variant-1.html" class="dropdown-link">Header : Variant : 1</a></li>
                                          <li class="dropdown-item"><a href="header-variant-2.html" class="dropdown-link">Header : Variant : 2</a></li>
                                          <li class="dropdown-item"><a href="header-variant-3.html" class="dropdown-link">Header : Variant : 3</a></li>
                                      </ul>
                                  </li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="header-option-light.html" class="dropdown-link">Header : Light <small class="text-muted">(default)</small></a></li>
                                  <li class="dropdown-item"><a href="header-option-dark.html" class="dropdown-link">Header : Dark</a></li>
                                  <li class="dropdown-item"><a href="header-option-color.html" class="dropdown-link">Header : Color</a></li>
                                  <li class="dropdown-item"><a href="header-option-transparent.html" class="dropdown-link">Header : Transparent</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="header-option-centered.html" class="dropdown-link">Header : Centered</a></li>
                                  <li class="dropdown-item"><a href="header-option-bottom.html" class="dropdown-link">Header : Bottom</a></li>
                                  <li class="dropdown-item"><a href="header-option-floating.html" class="dropdown-link">Header : Floating</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="header-option-fixed.html" class="dropdown-link">Header : Fixed</a></li>
                                  <li class="dropdown-item"><a href="header-option-reveal.html" class="dropdown-link">Header : Reveal on Scroll</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="header-option-ajax-search-json.html" class="dropdown-link">Ajax Search : Json</a></li>
                                  <li class="dropdown-item"><a href="header-option-ajax-search-html.html" class="dropdown-link">Ajax Search : Html</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Footer</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item dropdown"><a href="#" class="dropdown-link font-weight-bold" data-toggle="dropdown">Variants</a>
                                      <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                          <li class="dropdown-item"><a href="footer-variant-1.html#footer" class="dropdown-link">Footer : Variant : 1</a></li>
                                          <li class="dropdown-item"><a href="footer-variant-2.html#footer" class="dropdown-link">Footer : Variant : 2</a></li>
                                          <li class="dropdown-item"><a href="footer-variant-3.html#footer" class="dropdown-link">Footer : Variant : 3</a></li>
                                          <li class="dropdown-item"><a href="footer-variant-4.html#footer" class="dropdown-link">Footer : Variant : 4</a></li>
                                          <li class="dropdown-item"><a href="footer-variant-5.html#footer" class="dropdown-link">Footer : Variant : 5</a></li>
                                          <li class="dropdown-item"><a href="footer-variant-6.html#footer" class="dropdown-link">Footer : Variant : 6</a></li>
                                      </ul>
                                  </li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="footer-option-light.html" class="dropdown-link">Footer : Light</a></li>
                                  <li class="dropdown-item"><a href="footer-option-dark.html" class="dropdown-link">Footer : Dark <small class="text-muted">(default)</small></a></li>
                                  <li class="dropdown-item"><a href="footer-option-image.html" class="dropdown-link">Footer : Image</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Sliders</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="slider-swiper.html" class="dropdown-link">Swiper Slider</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Page Title</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="page-title-classic.html" class="dropdown-link">Page Title : Classic</a></li>
                                  <li class="dropdown-item"><a href="page-title-alternate.html" class="dropdown-link">Page Title : Alternate</a></li>
                                  <li class="dropdown-item"><a href="page-title-color.html" class="dropdown-link">Page Title : Color + Nav</a></li>
                                  <li class="dropdown-item"><a href="page-title-clean.html" class="dropdown-link">Page Title : Clean</a></li>
                                  <li class="dropdown-item"><a href="page-title-parallax-1.html" class="dropdown-link">Page Title : Parallax 1</a></li>
                                  <li class="dropdown-item"><a href="page-title-parallax-2.html" class="dropdown-link">Page Title : Parallax 2</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-item dropdown"><a href="#" class="dropdown-link" data-toggle="dropdown">Sidebar</a>
                              <ul class="dropdown-menu dropdown-menu-hover dropdown-menu-block-md shadow-lg b-0 m-0">
                                  <li class="dropdown-item"><a href="sidebar-float-dark.html" class="dropdown-link">Sidebar : Float : Dark</a></li>
                                  <li class="dropdown-item"><a href="sidebar-float-light.html" class="dropdown-link">Sidebar : Float : Light</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><a href="sidebar-static-dark.html" class="dropdown-link">Sidebar : Static : Dark</a></li>
                                  <li class="dropdown-item"><a href="sidebar-static-light.html" class="dropdown-link">Sidebar : Static : Light</a></li>
                                  <li class="dropdown-divider"></li>
                                  <li class="dropdown-item"><span class="d-block text-muted py-2 px-4 fs--13 font-weight-bold">Same as admin</span></li>
                                  <li class="dropdown-item"><a href="sidebar-float-admin-color.html" class="dropdown-link">Sidebar : Float</a></li>
                                  <li class="dropdown-item"><a href="sidebar-static-admin-color.html" class="dropdown-link">Sidebar : Static</a></li>
                              </ul>
                          </li>
                          <li class="dropdown-divider"></li>
                          <li class="dropdown-item"><a href="layout-boxed-1.html" class="dropdown-link">Boxed Layout</a></li>
                          <li class="dropdown-item"><a href="layout-boxed-0.html" class="dropdown-link">Boxed + Header Over</a></li>
                          <li class="dropdown-item"><a href="layout-boxed-2.html" class="dropdown-link">Boxed + Background</a></li>
                      </ul>
                  </div>

                </li>


                <!-- shop + blog -->
                <li class="nav-item dropdown dropdown-mega">

                  <a href="#" id="mainNavShop" class="nav-link dropdown-toggle" 
                    data-toggle="dropdown" 
                    aria-haspopup="true" 
                    aria-expanded="false">
                    Shop &amp; Blog
                  </a>

                  <div aria-labelledby="mainNavShop" class="dropdown-menu dropdown-menu-hover dropdown-menu-clean dropdown-menu-dark">
                      <!-- Blog and Shop : Megamenu -->
                      <ul class="list-unstyled m-0 p-0">
                          <li class="dropdown-item bg-transparent">

                              <div class="row col-border-md">

                                  <div class="col-12 col-md-3">

                                      <h3 class="h6 text-muted text-uppercase fs--14 mb-3">Shop Homepage</h3>
                                      <ul>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-index-1.html">Shop Home 1</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-index-2.html">Shop Home 2</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-index-3.html">Shop Home 3</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-index-4.html">Shop Home 4</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-index-christmas.html">Shop : Christmas</a>
                                          </li>
                                          
                                          <li class="dropdown-item">
                                              <a class="dropdown-link disabled" href="#!">More : Soon</a>
                                          </li>

                                      </ul>

                                  </div>

                                  <div class="col-12 col-md-3">

                                      <h3 class="h6 text-muted text-uppercase fs--14 mb-3">Shop Category</h3>
                                      <ul>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-category-1.html">Category 1</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-category-2.html">Category 2</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-category-3.html">Category 3</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-category-lazyload.html">Using Lazyload</a>
                                          </li>

                                      </ul>

                                  </div>

                                  <div class="col-12 col-md-3">

                                      <h3 class="h6 text-muted text-uppercase fs--14 mb-3">Shop Cart</h3>
                                      <ul>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-cart-1.html">Cart</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-cart-2.html">Cart Empty</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-checkout-success.html">Checkout Success</a>
                                          </li>

                                      </ul>

                                      <h3 class="h6 text-muted text-uppercase fs--14 mb-3 mt-5">Shop Product</h3>
                                      <ul>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-product-1.html">Product Page 1</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-product-2.html">Product Page 2</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-product-3.html">Product Page 3</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-product-4.html">Product Page 4</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="shop-page-product-5.html">Product Page 5</a>
                                          </li>

                                      </ul>

                                  </div>

                                  <div class="col-12 col-md-3">

                                      <h3 class="h6 text-muted text-uppercase fs--14 mb-3">Blog Pages</h3>
                                      <ul>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="blog-page-sidebar.html">With Sidebar</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="blog-page-sidebar-no.html">Without Sidebar</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="blog-page-single-sidebar.html">Single With Sidebar</a>
                                          </li>

                                          <li class="dropdown-item">
                                              <a class="dropdown-link" href="blog-page-single-sidebar-no.html">Single Without Sidebar</a>
                                          </li>

                                      </ul>

                                      <div class="mt-4">
                                          <img width="600" height="600" class="img-fluid" src="demo.files/svg/artworks/undraw_wireframing_nxyi.svg" alt="...">
                                      </div>

                                  </div>

                              </div>

                          </li>
                      </ul>
                  </div>

                </li>


                <!-- documentation -->
                <li class="nav-item dropdown">

                  <a href="#" id="mainNavDocumentation" class="nav-link dropdown-toggle nav-link-caret-hide" 
                    data-toggle="dropdown" 
                    aria-haspopup="true" 
                    aria-expanded="false">
                    <span>Documentation</span>
                  </a>

                  <div aria-labelledby="mainNavDocumentation" class="dropdown-menu dropdown-menu-clean dropdown-menu-dark dropdown-menu-hover w--300">                    
                    <!-- Documentation : no container, direct links! -->
                    <a href="documentation/index.html" class="dropdown-item transition-hover-left clearfix text-primary pt-4 pb-4 fs--13">

                      <span class="float-start w--50 mr--20">
                        <img width="50" height="50" class="img-fluid" src="demo.files/svg/icons/menu_doc_1.svg" alt="...">
                      </span>

                      DOCUMENTATION
                      <span class="d-block text-white text-truncate fs--14">
                        Don't get stuck!
                      </span>
                    </a>

                    <div class="dropdown-divider"></div>
                    
                    <a href="documentation/changelog.html" class="dropdown-item transition-hover-left clearfix text-primary pt-4 pb-4 fs--13">
                      
                      <span class="badge badge-secondary badge-soft position-absolute absolute-top right-0 ml-2 mr-2">v3.x</span>

                      <span class="float-start w--50 mr--20">
                        <img width="50" height="50" class="img-fluid" src="demo.files/svg/icons/menu_doc_2.svg" alt="...">
                      </span>

                      CHANGELOG
                      <span class="d-block text-white text-truncate fs--14">
                        Smarty Reborn Changes
                      </span>
                    </a>
                  </div>

                </li>




                <!-- social : mobile only (d-block d-sm-none)-->
                <li class="nav-item d-block d-sm-none text-center mb-4">

                  <h3 class="h6 text-muted">Follow Us</h3>

                  <a href="#!" class="btn btn-sm btn-facebook transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                    <i class="fi fi-social-facebook"></i> 
                  </a>

                  <a href="#!" class="btn btn-sm btn-twitter transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                    <i class="fi fi-social-twitter"></i> 
                  </a>

                  <a href="#!" class="btn btn-sm btn-linkedin transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                    <i class="fi fi-social-linkedin"></i> 
                  </a>

                  <a href="#!" class="btn btn-sm btn-youtube transition-hover-top mb-2 rounded-circle text-white" rel="noopener">
                    <i class="fi fi-social-youtube"></i> 
                  </a>

                </li>



                <!-- buy now : mobile only (d-block d-sm-none)-->
                <li class="nav-item d-block d-sm-none">
                  <a target="_blank" href="#buy_now" class="btn btn-block btn-primary shadow-none text-white m-0">
                    Buy Now
                  </a>
                </li>

              </ul>
              <!-- /NAVIGATION -->


            </div>





            <!-- OPTIONS -->
            <ul class="list-inline list-unstyled mb-0 d-flex align-items-end">

              <li class="list-inline-item mx-1 dropdown">

                <a href="#" aria-label="Account Options" id="dropdownAccountOptions" class="btn btn-sm rounded-circle btn-secondary" data-toggle="dropdown" aria-expanded="false" aria-haspopup="true">
                  <span class="group-icon">
                    <i class="fi fi-user-male"></i>
                    <i class="fi fi-close"></i>
                  </span>
                </a>


                <!--
                  
                  Dropdown Classes
                    .dropdown-menu-dark     - dark dropdown (desktop only, will be white on mobile)
                    .dropdown-menu-hover    - open on hover
                    .dropdown-menu-clean    - no background color on hover
                    .dropdown-menu-invert     - open dropdown in oposite direction (left|right, according to RTL|LTR)
                    .dropdown-click-ignore    - keep dropdown open on inside click (useful on forms inside dropdown)

                    Dropdown prefix icon (optional, if enabled in variables.scss)
                      .prefix-link-icon .prefix-icon-dot    - link prefix
                      .prefix-link-icon .prefix-icon-line   - link prefix
                      .prefix-link-icon .prefix-icon-ico    - link prefix
                      .prefix-link-icon .prefix-icon-arrow  - link prefix

                      .prefix-icon-ignore           - ignore, do not use on a specific link

                -->
                <div aria-labelledby="dropdownAccountOptions" class="prefix-link-icon prefix-icon-dot dropdown-menu dropdown-menu-clean dropdown-menu-invert dropdown-click-ignore dropdown-menu-dark p-0 mt--18 fs--15">
                  <div class="dropdown-header">
                    John Doe
                  </div>
                  <div class="dropdown-divider"></div>
                  <a href="account-orders.html" title="My Orders" class="dropdown-item text-truncate font-weight-light">
                    My Orders <small>(2)</small>
                  </a>
                  <a href="account-favourites.html" title="My Favourites" class="dropdown-item text-truncate font-weight-light">
                    My Favourites <small>(3)</small>
                  </a>
                  <a href="account-settings.html" title="Account Settings" class="dropdown-item text-truncate font-weight-light">
                    Account Settings
                  </a>
                  <div class="dropdown-divider mb-0"></div>
                  <a href="#!" title="Log Out" class="prefix-icon-ignore dropdown-footer dropdown-custom-ignore">
                    <i class="fi fi-power float-start"></i>
                    Log Out
                  </a>
                </div>

              </li>

              <li class="list-inline-item mx-1 dropdown">

                <a href="#" aria-label="website search" class="btn-sow-search-toggler btn btn-sm rounded-circle btn-secondary">
                  <i class="fi fi-search"></i>
                </a>

              </li>

              <li class="list-inline-item ml--6 mr--6 float-start d-none d-lg-inline-block">
                <a target="_blank" href="https://wrapbootstrap.com/theme/smarty-website-admin-rtl-WB02DSN1B" class="btn btn-sm btn-warning shadow-none m-0">
                  Buy Now
                </a>
              </li>

            </ul>
            <!-- /OPTIONS -->



          </nav>

        </div>
        <!-- /NAVBAR -->

      </header>
      <!-- /HEADER -->


    
