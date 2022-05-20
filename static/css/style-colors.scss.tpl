{#/*============================================================================
style.scss.tpl

    -This file contains all the theme styles related to settings defined by user from config/settings.txt
    -Rest of styling can be found in:
        --static/css/style-async.css.tpl --> For non critical styles witch will be loaded asynchronously
        --static/css/style-critical.tpl --> For critical CSS rendered inline before the rest of the site

==============================================================================*/#}

{# /*============================================================================
  Table of Contents
  #Colors and fonts
    // Colors
    // Font families
    // SVG Icons
    // Texts
    // Backgrounds 
  #Components
    // Margin and Padding
    // Mixins
    // Animations
    // Wrappers
    // Placeholders
    // Dividers    
    // Breadcrumbs
    // Headings
    // Buttons
    // Links
    // Chips
    // Progress bar 
    // Modals
    // Forms
    // Alerts and Notifications
    // Tooltip
    // Images
    // Tables
    // Tabs
    // Cards
    // Sliders
  #Home page
    // Home banners
    // Informative banners
    // Video
    // Instafeed
    // Featured products
    // Newsletter
    // Brands
  #Product grid
    // Category controls
    // Grid item
    // Labels
  #Product detail
    // Image
    // Form and info
  #Account page
    // Order items
  #Header and nav
    // Topbar
    // Header
    // Utilities
    // Search
    // Nav
  #Footer
    // Copyright
  #Media queries
    // Min width 768px
    //// Components
    //// Product grid

==============================================================================*/ #}

{#/*============================================================================
  #Colors and fonts
==============================================================================*/#}
	
{# /* // Colors */ #}

$primary-color: {{ settings.primary_color }};
$secondary-color: {{ settings.secondary_color }};
$main-foreground: {{ settings.text_color }};
$main-background: {{ settings.background_color }};

{# If store has accent color on it uses the accent color else uses primary color as default fallback #}
{% if settings.accent_color_active %}
  $accent-color: {{ settings.accent_color }};
{% else %}
  $accent-color: {{ settings.primary_color }};
{% endif %}

{# /* // Font families */ #}

$heading-font: {{ settings.font_headings | raw }};
$body-font: {{ settings.font_rest | raw }};

{# /* // SVG Icons */ #}

.svg-icon-primary{
  fill: $primary-color!important;
  &.svg-circle{
    border: 1px solid $primary-color;
  }
}
.svg-icon-text{
  fill: $main-foreground;
  &.svg-circle{
    border: 1px solid $main-foreground;
  }
  &.svg-solid{
    line-height: 42px;
    background: $main-background;
    border: 5px solid $primary-color;
    fill: $primary-color;
  }
}

.svg-icon-accent{
  fill: $accent-color;
}

.svg-icon-invert{
  fill: $main-background;
  &.svg-circle{
    border: 1px solid $main-background;
  }
}

.svg-circle{
  width: 30px;
  height: 30px;
  padding: 5px;
  border-radius: 50%;
  &-big {
    width: 50px;
    height: 50px;
    line-height: 48px;
  }
}

{# /* // Texts */ #}

.text-primary {
  color: $primary-color;
}

.text-secondary {
  color: $main-background;
}

.text-accent {
  color: $accent-color;
}

.bg-primary{
  background-color: $primary-color!important;
  color: $main-background!important;
  a{
    color: $main-background!important;
  }
}

{# /* // Backgrounds */ #}

.background-main{
  background-color: $main-background;
}

{#/*============================================================================
  #Components
==============================================================================*/#}

{# /* // Margin and Padding */ #}

%section-margin {
  margin-bottom: 70px;
}
%element-margin {
  margin-bottom: 20px;
}
%element-margin-half {
  margin-bottom: 10px;
}

{# /* // Mixins */ #}

@mixin text-decoration-none(){
  text-decoration: none;
  outline: 0;
  &:hover,
  &:focus{
    text-decoration: none;
    outline: 0;
  }
}

@mixin no-wrap(){
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: normal;
}

@mixin drop-shadow(){
	-moz-box-shadow: 0 0 3px #ccc;
	-webkit-box-shadow: 0 0 3px #ccc;
	box-shadow: 0 0 3px #ccc;
}

{# This mixin adds browser prefixes to a CSS property #}

@mixin prefix($property, $value, $prefixes: ()) {
	@each $prefix in $prefixes {
    	#{'-' + $prefix + '-' + $property}: $value;
	}
   	#{$property}: $value;
}

%border-radius {
  border-radius: 40px;
}

%border-radius-medium {
  border-radius: 20px;
}

%border-radius-small {
  border-radius: 10px;
}

{# /* // Animations */ #}

%simplefade {
  transition: all 0.5s ease;
}

{# /* // Functions */ #}

@function set-foreground-color($bg-color, $foreground-color) {
  @if (lightness($bg-color) > 50) {
    @return $foreground-color; // Lighter backgorund, return dark color
  } @else {
    @return lighten($foreground-color, 15%); // Darker background, return light color
  }
}

@function set-subnav-color($nav-color) {
  @if (lightness($nav-color) > 25) {
    @return rgba(0,0,0,0.18); // Lighter backgorund, return dark color
  } @else {
    @return rgba(255,255,255,0.1); // Darker background, return light color
  }
}

@function set-background-color($bg-color) {
  @if (lightness($bg-color) > 30) {
    @return darken($bg-color, 5%); // Lighter primary, return dark color
  } @else {
    @return lighten($bg-color, 5%); // Darker primary, return light color
  }
}

{# /* // Wrappers */ #}

%body-font {
  font-size: 14px;
}

body{
  color: $main-foreground;
  font-family: $body-font;
  background-color:$main-background;
  @extend %body-font;
}

.box{
  float: left;
  width: 100%;
  margin-bottom: 20px;
  padding:8px;
  @include prefix(box-shadow, -2px 3px 7px 3px rgba(0,0,0,0.04), webkit ms moz o);
  @extend %border-radius-small;
  &.box-border {
    padding: 15px;
    border: 1px solid rgba($main-foreground, .1);
    box-shadow: none;
  }
}

.box-rounded {
  @extend %border-radius-medium;
  overflow: hidden;
}

.box-rounded-small {
  @extend %border-radius-small;
  overflow: hidden;
}

{# /* // Placeholders */ #}

.placeholder-container{
  background-color:rgba($primary-color, 0.1);
}
.placeholder-color{
  background-color:rgba($primary-color, 0.2);
}
.placeholder-icon svg{
  fill:rgba($primary-color, 0.2);
}
.placeholder-page{
  background: $primary-color;
  &:hover,
  &.active{
      background: $primary-color;
      opacity: 0.8;
  }
}
.placeholder-shine,
.placeholder-fade{
  background-color:rgba($primary-color, 0.2);
}


.placeholder-overlay {
    background-color:rgba($main-foreground, 0.3);
    opacity: 0;
    &:hover,
    &:active,
    &:focus {
        opacity: 1;
    }
}

.placeholder-info {
  color: $main-background;
  fill: $main-background;
  background-color: $primary-color;
  box-shadow: 0 1px 3px rgba(0,0,0,0.5);
  .placeholder-button {
    color: $primary-color;
    background-color: $main-background;
    opacity: 1;
    &:hover {
      opacity: .8;
    }
  }
}

.spinner-ellipsis {
  .point {
    background-color: rgba($main-foreground, 0.2);
  }
  &.invert .point{
    background-color: $main-background;
  }
}


{# /* // Dividers */ #}

.divider{
  margin-top: 20px;
  margin-bottom: 20px;
  clear: both;
  border-bottom: 1px solid rgba($main-foreground, .1);
}

{# /* // Breadcrumbs */ #}

.breadcrumbs {
  @extend %element-margin-half;
  .divider{
    margin: 3px;
    opacity: 0.6;
  }
  .crumb{
    opacity: 0.6;
    &.active{
      opacity: 1;
    }
  }
}


{# /* Headings */ #}

.page-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
  }
}

.category-header {
  @extend %element-margin;
  h1, .h1{
    margin-bottom: 0;
  }
}

h1,.h1,
h2,.h2,
h3,.h3,
h4,.h4,
h5,.h5,
h6,.h6{
  margin-top: 0;
  font-family: $heading-font;
}

{# /* // Buttons */ #}

.btn{
  text-decoration: none;
  text-align: center;
  border: 0;
  cursor: pointer;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  text-transform: uppercase;
  white-space: normal;
  background: none;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
  &[disabled],
  &.disabled,
  &[disabled]:hover,
  &.disabled:hover,{
    opacity: 0.8;
    cursor: not-allowed;
    outline: 0;
  }
  &-default{
    display: block;
    padding: 12px;
    width: 100%;
    border: 1px solid rgba($main-foreground, .3);
    @extend %border-radius-small;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    color: $main-foreground;
    fill: $main-foreground;
    background-color: $main-background;
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    &:hover{
      border: 1px solid $primary-color;
      svg{
        fill: $primary-color;
      }
    }
  }
  &-primary{
    padding: 13px;
    background-color: $primary-color;
    color: $main-background;
    fill: $main-background;
    @extend %border-radius;
    letter-spacing: 2px;
    @extend %body-font;
    font-weight: bold;
    &:hover{
      color: $main-background;
    }
  }
  &-secondary{
    padding: 13px;
    color: $primary-color;
    border: 1px solid $primary-color;
    @extend %border-radius;
    letter-spacing: 2px;
    @extend %body-font;
    font-weight: bold;
    &:hover{
      color: $primary-color;
    }
    &.invert{
      color: $main-background;
      border: 1px solid $main-background;
      &:hover{
        color: $main-background;
        opacity: 0.8;
      }
    }
  }
  &-block{
    float: left;
    width: 100%;
  }
  &-medium{
    padding: 12px;
    font-size: 12px;
  }
  &-small{
    display: inline-block;
    padding: 10px;
    font-size: 10px;
    letter-spacing: 1px;
  }
  &-facebook{
    color: #1977f2;
    border: 1px solid #1977f2;
    .svg-fb-icon {
      position: relative;
      bottom: 1px;
      height: 16px;
      margin-right: 5px;
      vertical-align: middle;
      fill: #1977f2;
    }
    &:hover {
      background: #1977f2;
      color: #fff;
      .svg-fb-icon {
        fill: #fff;
      }
    }
  }
}

button{
  cursor: pointer;
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
}

{# /* // Links */ #}

a {
  color: $main-foreground;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    color: rgba($main-foreground, .5);
  }
}

.link-contrast {
  color: $main-background;
  &:hover,
  &:focus{
    color: rgba($main-background, .8);
  }
}

.btn-link{
  color: $main-foreground;
  fill: $main-foreground;
  cursor: pointer;
  &:hover,
  &:focus{
    color: $primary-color;
    fill: $primary-color;
    svg {
      fill: $primary-color;
    }
  }
  &.toggled{
    color: $primary-color;
  }
  &.invert{
    color: $main-background;
    fill: $main-background;
    &:hover,
    &:focus{
      color: $main-background;
      fill: $main-background;
      opacity: 0.5;
    }
  }
  &-primary{
    color: $primary-color;
    fill: $primary-color;
    font-weight: bold;
    &:hover,
    &:focus{
      color: $primary-color;
      fill: $primary-color;
      opacity: 0.5;
    }
  }
}

{# /* // Chips */ #}

.chip{
  color: $main-foreground;
  background-color: rgba($main-foreground, .08);
  &-remove-icon {
    background-color: $main-background;
    fill: $main-foreground;
  }
}

{# /* // Progress bar */ #}

.bar-progress {
  background: rgba($main-foreground, 0.1);
  &-active {
    background-image: linear-gradient(-90deg, rgba($accent-color, 1), rgba($accent-color, .2));
  }
  &-check {
    background-color: $main-background;
    fill: $accent-color;
  }
}

{# /* // Modals */ #}

.modal{
  color: $main-foreground;
  background-color:$main-background;
  @extend %border-radius-small;
  &-header{
    background-color:$primary-color;
    color: $main-background;
    fill: $main-background;
    border-bottom: 1px solid $main-background;
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    &:hover,
    &:focus{
      background-color:$main-background;
      color: $primary-color;
      fill: $primary-color;
      border-bottom: 1px solid $primary-color;
    }
  }
  .modal-close{
    &.no-header{
      border-radius: 100%;
    }
    &.invert{
      fill: $main-background;
      border: 1px solid $main-background;
    }
  }
}

{# /* // Forms */ #}

input,
textarea {
  font-family: $body-font;
}

.form-control::-webkit-input-placeholder { 
  color: rgba($main-foreground, .5);
}
.form-control:-moz-placeholder {
  color: rgba($main-foreground, .5);
}
.form-control::-moz-placeholder {
  color: rgba($main-foreground, .5);
}
.form-control:-ms-input-placeholder {
  color: rgba($main-foreground, .5);
}

.form-control,
.form-select,
.form-quantity{
  display: block;
  padding: 12px;
  width: 100%;
  font-size: 16px; /* Hack to avoid autozoom on IOS */
  border: 1px solid rgba($main-foreground, .3);
  @extend %border-radius-small;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  fill: $main-foreground;
  background-color: $main-background;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover{
    border: 1px solid $primary-color;
    & + .form-select-icon{
      fill: $primary-color;
    }
  }
  &:focus{
    outline:0px !important;
    -webkit-appearance:none;
  }
  &-inline{
    display: inline;
  }
  &-small{
    padding: 8px 10px;
    font-size: 12px;
  }
  &-big{
    padding: 17px 15px;
  }
}

.form-control-btn{
  position: absolute;
  top: 12px;
  right: 10px;
  &-icon{
    width: 18px;
    height: 18px;
  }
}

.form-quantity{
  .form-control{
    width: 100%;
    padding: 0;
    background-color: transparent;
    -webkit-appearance: none;
    border: 0;
    text-align: center;
  }
  &-icon{
    width: 16px;
    fill: $main-foreground;
  }
  &.small{
    width: 120px;
    float: left;
    padding: 8px;
  }
}

input::-webkit-inner-spin-button,
input::-webkit-outer-spin-button{
  -webkit-appearance: none;
  margin: 0;
}

.form-select{
  cursor: pointer;
}
.form-select-icon{
  background: $main-background;
  fill: $main-foreground;
}

.form-group-inline{
  .form-control{
    border-right: 0;
    border-radius: 10px 0 0 10px;
  }
  .btn{
    padding: 13px 12px 12px 12px;
    border-radius: 0 10px 10px 0;
  }
}

.radio-button {
  .radio-button-content{
    border: 2px solid transparent;
    border-bottom: 1px solid rgba($main-foreground, .06);
  }
  &-icon.unchecked{
    background-color: $main-background;
  }
  input[type="radio"]{
    & +  .radio-button-content .unchecked{
      border: 1px solid rgba($main-foreground, .5);
    }
    &:checked + .radio-button-content .unchecked{
      border: 1px solid $primary-color;
    }
    &:checked + .radio-button-content{
      border: 2px solid $primary-color;
      @include prefix(transition, all 0.2s , webkit ms moz o);
    }
    &:checked + .radio-button-content .radio-button-icons-container{
      background-color: $primary-color;
    }
  }
}

.checkbox-container{
  .checkbox-icon {
    background: $main-background;
    border: 1px solid $main-foreground;
    &:after {
      border: solid $primary-color;
      border-width: 0 2px 2px 0;
    }
  }
  .checkbox:hover,
  input:checked ~ .checkbox {
    color: $primary-color;
    fill: $primary-color;
    .checkbox-icon {
      border: 1px solid $primary-color;
    }
  }
  .checkbox-color{
    border: 1px solid rgba($main-foreground, .06);
  }
}

.list .list-unstyled,
.list{
  .radio-button-item .radio-button-content,
  .list-item{
    border-bottom: 1px solid rgba($main-foreground, .06);
  }
  .radio-button-item:last-child .radio-button-content,
  .list-item:last-child{
    border-bottom: 0;
  }
}


{# /* // Alerts and notifications */ #}

.alert{
  @extend %border-radius-small;
  &:before{
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-right: 10px;
    vertical-align: bottom;
  }
  &-danger,
  &-error{
    color: set-foreground-color($main-background, #cc4845);
    border-color: set-foreground-color($main-background, #cc4845);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23cc4845"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
    }
  }
  &-warning{
    color: set-foreground-color($main-background, #d27611);
    border-color: set-foreground-color($main-background, #d27611);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23d27611"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
    }
  }
  &-info{
    color: set-foreground-color($main-background, #3d9ccc);
    border-color: set-foreground-color($main-background, #3d9ccc);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%233d9ccc"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-36 344h12V232h-12c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12h48c6.627 0 12 5.373 12 12v140h12c6.627 0 12 5.373 12 12v8c0 6.627-5.373 12-12 12h-72c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12zm36-240c-17.673 0-32 14.327-32 32s14.327 32 32 32 32-14.327 32-32-14.327-32-32-32z"/></svg>');
    }
  }
  &-success{
    color: set-foreground-color($main-background, #3caf65);
    border-color: set-foreground-color($main-background, #3caf65);
    &:before{
      content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%233caf65"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
    }
  }
  &-primary {
    border-color: $primary-color;
    color: $primary-color;
  }
}

.bg-primary{
  .alert{
    &-danger,
    &-error{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-11.49 120h22.979c6.823 0 12.274 5.682 11.99 12.5l-7 168c-.268 6.428-5.556 11.5-11.99 11.5h-8.979c-6.433 0-11.722-5.073-11.99-11.5l-7-168c-.283-6.818 5.167-12.5 11.99-12.5zM256 340c-15.464 0-28 12.536-28 28s12.536 28 28 28 28-12.536 28-28-12.536-28-28-28z"/></svg>');
      }
    }
    &-warning{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M270.2 160h35.5c3.4 0 6.1 2.8 6 6.2l-7.5 196c-.1 3.2-2.8 5.8-6 5.8h-20.5c-3.2 0-5.9-2.5-6-5.8l-7.5-196c-.1-3.4 2.6-6.2 6-6.2zM288 388c-15.5 0-28 12.5-28 28s12.5 28 28 28 28-12.5 28-28-12.5-28-28-28zm281.5 52L329.6 24c-18.4-32-64.7-32-83.2 0L6.5 440c-18.4 31.9 4.6 72 41.6 72H528c36.8 0 60-40 41.5-72zM528 480H48c-12.3 0-20-13.3-13.9-24l240-416c6.1-10.6 21.6-10.7 27.7 0l240 416c6.2 10.6-1.5 24-13.8 24z"/></svg>');
      }
    }
    &-info{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 40c118.621 0 216 96.075 216 216 0 119.291-96.61 216-216 216-119.244 0-216-96.562-216-216 0-119.203 96.602-216 216-216m0-32C119.043 8 8 119.083 8 256c0 136.997 111.043 248 248 248s248-111.003 248-248C504 119.083 392.957 8 256 8zm-36 344h12V232h-12c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12h48c6.627 0 12 5.373 12 12v140h12c6.627 0 12 5.373 12 12v8c0 6.627-5.373 12-12 12h-72c-6.627 0-12-5.373-12-12v-8c0-6.627 5.373-12 12-12zm36-240c-17.673 0-32 14.327-32 32s14.327 32 32 32 32-14.327 32-32-14.327-32-32-32z"/></svg>');
      }
    }
    &-success{
      color: $main-background;
      border-color: $main-background;
      &:before{
        content: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" fill="%23{{ settings.background_color |trim('#') }}"><path d="M256 8C119.033 8 8 119.033 8 256s111.033 248 248 248 248-111.033 248-248S392.967 8 256 8zm0 464c-118.664 0-216-96.055-216-216 0-118.663 96.055-216 216-216 118.664 0 216 96.055 216 216 0 118.663-96.055 216-216 216zm141.63-274.961L217.15 376.071c-4.705 4.667-12.303 4.637-16.97-.068l-85.878-86.572c-4.667-4.705-4.637-12.303.068-16.97l8.52-8.451c4.705-4.667 12.303-4.637 16.97.068l68.976 69.533 163.441-162.13c4.705-4.667 12.303-4.637 16.97.068l8.451 8.52c4.668 4.705 4.637 12.303-.068 16.97z"/></svg>');
      }
    }
    &-primary {
      border-color: $main-background;
      color: $main-background;
    }
  }
}

.notification {
    &-primary {
        color: $main-background;
        background-color: darken($primary-color, 5%);
    }
    &-arrow-up {
        border-right: 10px solid transparent;
        border-bottom: 10px solid $main-background;
        border-left: 10px solid transparent;
    }
    &-floating .notification-primary {
        color: $main-foreground;
        background-color: $main-background;
        border-color: rgba($primary-color, .2);
    }
    &-secondary {
        background: $secondary-color;
        color: $main-background;
    }
    &-tertiary {
        color: $primary-color;
        background: lighten($main-foreground, 80%);
    }
    &-img svg {
        border-radius: 100%;
        background: $main-background;
    }
    &-danger {
        color: set-foreground-color($main-background, #cc4845);
    }   
}

{# /* // Tooltip */ #}

.tooltip{
  background: $secondary-color;
  color: $primary-color;
}
    
.tooltip-arrow{
  border-left: 10px solid transparent;
  border-right: 10px solid transparent;
  border-bottom: 10px solid $secondary-color;
}

{# /* // Images */ #}

.card-img{
  @extend %border-radius-small;
  &-pill {
    background-color: $main-background;
    color: $main-foreground;
  }
}

{# /* // Tables */ #}

.table{
  background-color: $main-background;
  color: $main-foreground;
  tbody{
    tr:nth-child(odd){
      background-color: rgba($primary-color, .05);
    }
  }
  th{
    padding: 8px;
    text-align: left;
  }
}

{# /* // Tabs */ #}

.tab-group{
  .tab{
    &-link{
      border: 1px solid transparent;
      color: $main-foreground;
      @extend %border-radius;
    }
    &.active{
      .tab-link{
        border: 1px solid $primary-color;
        color: $primary-color;
      }
    }
  }
}

{# /* Cards */ #}

.card {
  background-color: $main-background;
  border: 1px solid rgba($main-foreground, .08);
}

.card-header {
  background-color: rgba($main-foreground, .1);
}

{# /* // Sliders */ #}

.swiper-text {
  @extend %simplefade;
  opacity: 0;
  top: 60%;
}
.swiper-title {
  font-family: $heading-font;
}
.swiper-slide-active .swiper-text {
  opacity: 1;
  top: 50%;
}

.swiper-dark {
  color: $main-foreground;
  .swiper-btn {
    color: $main-background;
    background-color: $main-foreground;
  }
}

.swiper-light {
  color: $main-background;
  .swiper-btn {
    color: $main-foreground;
    background-color: $main-background;
  }
}

.swiper-pagination-bullet-active {
  background-color: $main-foreground;
}

.swiper-pagination-fraction{
  border-bottom: 1px solid rgba($main-foreground, .2);
}

{#/*============================================================================
  #Home Page
==============================================================================*/#}

{# /* // Home banners */ #}

.textbanner-image.overlay:after {
  position: absolute;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba($main-foreground, .4);
  content: '';
}

.textbanner-link:hover {
  color: $main-foreground;
  .textbanner-text {
    border-bottom: 1px solid $main-foreground;
    &.over-image,
    &-primary {
      border: 0;
    }
  }
}

.textbanner-text {
  border-bottom: 1px solid rgba($main-foreground, .1);
  &-primary {
    border: 0;
    background: $primary-color;
    color: $main-background;
  }
}

{# /* // Informative banners */ #}

.section-informative-banners {
  @extend %section-margin;
  background: rgba($main-foreground, .1);
}

.service-icon {
  fill: $main-foreground;
}

{# /* // Video */ #}

.section-video-home {
  @extend %element-margin;
}

.embed-responsive {
  background: $main-foreground;
}

.video-player-icon {
  background: $primary-color;
}

{# /* // Instafeed */ #}

.instafeed-title {
  display: block;
  @extend %element-margin;
  line-height: 42px;
  color: $main-foreground;
}

.instafeed-info {
  color: $main-background;
  background: rgba($main-foreground, .6);
}

{# /* // Featured products */ #}

.section-featured-home {
  position: relative;
  @extend %element-margin;
}

{# /* // Newsletter */ #}

.section-newsletter-home {
  padding: 70px 0;
  background: $primary-color;
  color: $main-background;
}

.newsletter .form-control{
  border: 0;
  color: $primary-color;
  &::-webkit-input-placeholder { 
    color: $primary-color;
  }
  &:-moz-placeholder {
    color: $primary-color;
  }
  &::-moz-placeholder {
    color: $primary-color;
  }
  &:-ms-input-placeholder {
    color: $primary-color;
  }
}

.newsletter-btn {
  color: $main-foreground;
}

{# /* // Brands */ #}

.section-brands-home {
  @extend %element-margin;
  background: rgba($main-foreground, .1);
}


{#/*============================================================================
  #Product grid
==============================================================================*/#}

{# /* // Category controls */ #}

.category-controls {
  background-color: $main-background;
  &.is-sticky {
    box-shadow: 0 2px 2px 0 rgba($main-foreground, .14), 0 3px 1px -2px rgba($main-foreground, .2), 0 1px 5px 0 rgba($main-foreground, .12);
  }
}

.filters-overlay {
  background-color: rgba($main-background, .85);
}

{# /* // Grid item */ #}

.item {
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &-rounded {
    border: 1px solid rgba($main-foreground, .1);
    .item-description {
      border-top: 4px solid $primary-color;
      border-bottom: 1px solid transparent;
    }
  }
  &-link {
    color: $main-foreground;
  }
  &-price {
    color: $primary-color;
  }
  &-buy-variants {
    background: rgba($main-background, .9);
  }
  &-colors {
    background: rgba($main-background, .9);
    &-bullet {
      border: 1px solid rgba($main-foreground, .5);
      &.selected {
        border: 2px solid $main-foreground;
      }
    }
  }
}

{# /* // Labels */ #}

.label {
  background: $main-foreground;
  color: $main-background;
  &.label-primary{
    background: $primary-color;
    color: $main-background;
  }
  &.label-secondary{
    background: $secondary-color;
    color: $main-background;
  }
  &.label-accent{
    background: $accent-color;
    color: $main-background;
  }
}

{#/*============================================================================
  #Product detail
==============================================================================*/#}

{# /* // Image */ #}

.nube-slider-product {
  @extend %element-margin;
}

.product-thumb{
  &.selected{
    box-shadow: 0px 4px 0px 0px $primary-color
  }
  img{
    width: auto;
    height: 100%;
  }
}

.thumb-see-more{
  background-color: rgba($main-background, .5);
  color: $primary-color;
  &:hover{
    background-color: rgba($main-background, .9);
  }
}

.product-video-container {
  background-color: rgba($main-foreground, .07);
}

{# /* // Form and info */ #}
    
.social-share {
  @extend %element-margin;
  .social-share-button {
    color: $main-foreground;
  }
}

.product-description {
  @extend %element-margin;
}

{#/*============================================================================
  #Contact page
==============================================================================*/#}

{# /* // Data contact */ #}

.contact-item {
  @extend %element-margin;
  &-icon {
    fill: $main-foreground;
  }
}

.contact-link {
  color: $main-foreground;
}


{#/*============================================================================
  #Account page
==============================================================================*/#}

.account-page {
  @extend %section-margin;
}

{# /* // Order item */ #}

.order-item {
  padding: 15px 0;
  border-bottom: 1px solid rgba($main-foreground, .08);
  &:first-child {
    border-top: 1px solid rgba($main-foreground, .08);
  }
}

{#/*============================================================================
  #Header and nav
==============================================================================*/#}

{# /* // Topbar */ #}

.section-topbar {
  background-color: $secondary-color;
  color: $main-background;
  fill: $main-background;
}

{# /* // Header */ #}

.head-light{
  color: $primary-color;
  fill: $primary-color;
  background-color: $main-background;
  @extend %simplefade;
  a:not(.btn-primary),
  .svg-icon-text {
    color: $primary-color;
    fill: $primary-color;
  }

  .badge {
    color: $main-background;
    background: $primary-color;
  }

  .notification a,
  .notification .svg-icon-text {
    color: $main-background;
    fill: $main-background; 
  }

  .form-control{
    color: $primary-color;
    border: 1px solid $primary-color;
    &::-webkit-input-placeholder { 
      color: $primary-color;
    }
    &:-moz-placeholder {
      color: $primary-color;
    }
    &::-moz-placeholder {
      color: $primary-color;
    }
    &:-ms-input-placeholder {
      color: $primary-color;
    }
  }
  .nav-account {
    a,
    svg {
      color: $main-background;
      fill: $main-background;
    }
  }
}

.head-dark,
.head-primary{
  color: $main-background;
  fill: $main-background;
  background-color: $main-foreground;
  .svg-icon-text,
  .nav-desktop-list > .nav-item > .nav-list-link,
  .nav-desktop-list > .nav-item > .nav-item-container > .nav-list-link,
  .nav-desktop-list > .nav-item > .nav-item-container > .nav-list-arrow > i,
  .utilities-item svg{
    color: $main-background;
    fill: $main-background;
    border-color: rgba($main-background, 0.2)
  }
  .nav-desktop-list > .nav-item > .nav-item-container > .nav-list-link.selected,
  .nav-desktop-list > .nav-item > .nav-item-container > .nav-list-link.selected + .nav-list-arrow > i{
    color: $main-background;
    fill: $main-background;
    opacity: 0.6;
  }
  .form-control{
    background-color: $main-background;
    border: 0;
  }
  a {
    color: $main-background;
    fill: $main-background;
  }
  .btn-secondary {
    color: $primary-color;
  }
  .badge {
    color: $main-background;
    background: $primary-color;
  }
}

.head-primary{
  background-color: $primary-color;
  .icon-underline:after{
    background-color: rgba($main-background, .4);
  }
  .badge {
    color: $primary-color;
    background: $secondary-color;
  }
  .form-control{
    color: $primary-color;
    &::-webkit-input-placeholder { 
      color: $primary-color;
    }
    &:-moz-placeholder {
      color: $primary-color;
    }
    &::-moz-placeholder {
      color: $primary-color;
    }
    &:-ms-input-placeholder {
      color: $primary-color;
    }
  }
  .search-suggest {
    background-color: $primary-color;
    .search-suggest-item {
      border-bottom: 1px solid rgba($main-background, .1);
    }
    a.btn {
      background-color: $main-background;
      color: $primary-color;
      fill: $primary-color;
    }
  }

  .modal-close{
    fill: $main-background;
  }
  .nav-primary {
    .nav-list {
      .nav-item {
        border-color: rgba($main-background, .2);
      }
      .list-subitems {
        background-color: set-subnav-color($primary-color);
      }
    } 
  }
}

{# /* // Utilities */ #}

.subutility-list {
 background-color: $primary-color;
 box-shadow: 0 1px 6px rgba(0,0,0,0.2);
}

.head-light{
  .subutility-list {
   background-color: $main-background;
  }
  .search-suggest {
    background-color: $main-background;
    a.btn {
      color: $main-background;
      fill: $main-background;
    }
  }
  .nav-list-link {
    border-color: rgba($main-foreground, .2);
  }
  .modal-close{
    fill: $primary-color;
  }
  .nav-primary {
    .nav-list {
      .nav-item {
        border-color: rgba($main-foreground, .1);
      }
      .list-subitems {
        background-color: set-subnav-color($main-background);
      }
    } 
  }
}

.head-dark{
  .subutility-list {
   background-color: $main-foreground;
  }
  .search-input-submit {
    fill: $main-foreground;
  }
  .search-suggest {
    background-color: $main-foreground;
    .search-suggest-item {
      border-bottom: 1px solid rgba($main-background, .1);
    }
    a.btn {
      background-color: $main-background;
      color: $primary-color;
      fill: $primary-color;
    }
  }
  .nav-list-link {
    border-color: rgba($main-background, 0.2);
  }
  .modal-close{
    fill: $main-background;
  }
  .nav-primary {
    .nav-list {
      .nav-item {
        border-color: rgba($main-background, 0.1);
      }
      .list-subitems {
        background-color: set-subnav-color($main-foreground);
      }
    } 
  }
}



{# /* // Search */ #}

.search-input-submit {
  fill: $primary-color;
}

.search-suggest {
  box-shadow: 0 1px 6px rgba(0, 0, 0, 0.2);
  .search-suggest-item {
    border-bottom: 1px solid rgba($main-foreground, .1);
  }
}


{# /* // Nav */ #}

.nav-row {
  border-color: rgba($main-background, .2);
}

.desktop-dropdown::-webkit-scrollbar-track {
  background: darken($main-background, 5%);
}
.desktop-dropdown::-webkit-scrollbar-thumb {
  background: darken($primary-color, 10%);
}
.desktop-dropdown::-webkit-scrollbar-thumb:hover {
  background: darken($primary-color, 20%);
}
.desktop-list-subitems {
 background-color: rgba($primary-color, .95);
}


.head-light{
  .nav-row {
    border-color: rgba($primary-color, .2);
    border-bottom: 1px solid rgba($primary-color, .2);
  }
  .desktop-dropdown::-webkit-scrollbar-track {
    background: darken($main-background, 10%);
  }
  .desktop-dropdown::-webkit-scrollbar-thumb {
    background: darken($primary-color, 0%); 
  }
  .desktop-dropdown::-webkit-scrollbar-thumb:hover {
    background: darken($primary-color, 10%); 
  }
  .desktop-list-subitems {
    background-color: rgba($main-background, .95);
    color: $primary-color;
    fill: $primary-color;
    border-top: 1px solid rgba($primary-color, .1);
    border-bottom: 1px solid rgba($primary-color, .1);
  }
  .nav-categories-container:after,
  .nav-categories-container:before {
    background-image: linear-gradient(-90deg, transparent, darken($main-background, 3%));
  }
}

.head-dark{
  .nav-row {
    border-color: rgba($main-background, .15);
  }
  .desktop-dropdown::-webkit-scrollbar-track {
    background: darken($main-background, 20%);
  }
  .desktop-dropdown::-webkit-scrollbar-thumb {
    background: lighten($main-foreground, 20%); 
  }
  .desktop-dropdown::-webkit-scrollbar-thumb:hover {
    background: lighten($main-foreground, 30%);
  }
  .desktop-list-subitems {
    background-color: rgba($main-foreground, .95);
    color: $main-background;
    fill: $main-background;
  }
  .nav-categories-container:after,
  .nav-categories-container:before {
    background-image: linear-gradient(-90deg, transparent, darken($main-foreground, 3%));
  }
}

.nav-categories-container:after,
.nav-categories-container:before {
  background-image: linear-gradient(-90deg, transparent, darken($primary-color, 2%));
}

.nav-secondary {
  .nav-account {
    background-color: set-background-color($primary-color);
    box-shadow: 0 2px 5px rgba($main-foreground, .4);
  }
}

.modal-nav-hamburger {
  .navigation-topbar {
    background-color: $secondary-color;
    fill: $main-background;
  }
}


{#/*============================================================================
  #Footer
==============================================================================*/#}

footer {
  color: $primary-color;
  background: rgba($main-foreground, .1);
  a,
  .contact-link {
    color: $primary-color;
  }
  .contact-item-icon {
    fill: $primary-color;
  }
}

.social-icon-rounded {
  background: $primary-color;
  fill: $main-background;
  &:hover {
    background: $secondary-color;
  }
}

.section-footer {
  @extend %section-margin;
}
.element-footer {
  @extend %element-margin;
}

.powered-by-logo svg {
  fill: $main-background;
}

.footer-legal {
  background: $primary-color;
  color: $main-background;
  a {
    color: $main-background;
    &:hover {
      opacity: .8;
    }
  }
}

{#/*============================================================================
  #Media queries
==============================================================================*/ #}

{# /* // Min width 768px */ #}

@media (min-width: 768px) { 

  {# /* //// Components */ #}

  {# /* Forms */ #}

  .form-control,
  .form-select,
  .form-quantity{
    font-size: 14px;
  }

  {# /* Modals */ #}

  .modal-header{
    &:hover,
    &:focus{
      .modal-close{
        border: 1px solid $primary-color;
      }
    }
  }
  .modal-close{
    border: 1px solid $main-background;
    border-radius: 100%;
  }

  {# /* Slider */ #}

  .swiper-text {
    opacity: 0;
    top: 40%;
  }
  .swiper-slide-active .swiper-text {
    opacity: 1;
    top: 50%;
  }

  {# /* //// Home Banners */ #}

  .textbanner-shadow {
    @include prefix(transition, all 0.4s ease, webkit ms moz o);
    &:hover {
      box-shadow: 0 1px 10px rgba($main-foreground, .2);
    }
  }

  {# /* //// Product grid */ #}

  .item {
    &-description {
      border-bottom: 1px solid rgba($main-foreground, .2);
      @include prefix(transition, all 0.4s ease, webkit ms moz o);
    }
    &-product:hover {
      box-shadow: 0 1px 6px rgba($main-foreground, .2);
      .item-description {
        border-bottom: 1px solid transparent;
      }
    }
    &-rounded .item-actions {
      background: $main-background;
      box-shadow: 0 6px 6px rgba($main-foreground, .2);
    }
  }

}


.fundo-pagina{ background: #F2F2F2; }



{# ---------------------------------------------------------------------------------------- #}
{# Cabeçalho do Site #}
{# ---------------------------------------------------------------------------------------- #}

@media (max-width: 767px){
  .header-elements > .row > div{
    padding-left: 12px;
    padding-right: 12px;
    &.col-logo{ padding-left: 0; padding-right: 0; }
    &.col-utilities{ padding-left: 0; }
  }
}



header.head-primary{
  transition: all .4s ease;
  background-color: #000000;

  .link-logo-header{     
    display: inline-block;
    margin: .24rem 0;
    img{ transition: all .4s ease; }
  }
  


  {# Importante! #}
  @media (max-width: 767px){
    position: -webkit-sticky;
    position: -moz-sticky;
    position: -o-sticky;
    position: -ms-sticky;
    position: sticky;
    top: 0 !important;
    width: 100% !important;
    z-index: 88888 !important;
  }

  .search-input{
    background: rgba(0, 0, 0, 0);
    color: #FFFFFF !important;
    transition: all .4s ease;
    font-weight: 500;
    border-radius: 0;
    padding: .56rem 2.4rem .4rem 1.2rem;
    height: 2.16rem;
    line-height: .8rem;
    font-size: 1.04rem;
    border-bottom: 1px solid #FFFFFF;

    &::-webkit-input-placeholder { 
      color: #FFFFFF;
    }
    
    &:-moz-placeholder {
      color: #FFFFFF;
    }
    &::-moz-placeholder {
      color: #FFFFFF;
    }
    &:-ms-input-placeholder {
      color: #FFFFFF;
    }

  }

  .search-input-submit{ 
    padding: 0;
    position: absolute;
    right: 0;
    top: 0;
    background: transparent;
    height: 2.16rem;
    width: 2.16rem;
    padding-right: 1.84rem;
   }
  .search-input-submit svg{ font-size: 1.28rem; }

  .utility-user .subutility-list{
    background: #FFFFFF;
    font-size: .88rem;
    line-height: .88rem;

    a{
      transition: border .4s ease;
      color: #000000;
      border-bottom: 1px solid #FFFFFF;
      &:hover{ border-color: #000000; }
    }

    @media (min-width: 768px){
      margin-top: -1.2rem;
    }
  }


  .search-suggest{
    @media (min-width: 768px){
      width: 32rem;
      right: 15px;
    }
  }


  .utilities-item{ 
    max-width: 4rem; 
    @media (max-width: 767px){ padding-left: 0; padding-right: 0; }
  }

  .utilities-item svg{
    fill: #FFFFFF;
    width: auto;
    height: 1.84rem;
    max-width: 100%;
    transition: fill .4s ease;
  }


  .badge-amount{
    background: rgba(0, 0, 0, 0);
    color: #FFFFFF;
    bottom: unset;
    width: 1.2rem;
    height: 1.2rem;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: .64rem;
    line-height: .64rem;
    z-index: 999;
    font-weight: 600;
    right: 0.4rem;
    top: 1.44rem;

    @media (min-width: 768px){    
      right: 36%;
      top: 1.44rem;
    }

  }


  .notification-floating{
      min-width: 280px;
      left: auto;
      right: 0rem;
      top: 6.4rem;
      @media (min-width: 768px){
        min-width: 24rem;
        right: 2.4rem;
        top: unset;
      }
  }

}


.nav-desktop{
  padding: 0;


  & > .nav-desktop-list > .nav-item {
    position: relative;
    padding: 0;

    .desktop-list-subitems{
      background: #FFFFFF;

      & > .nav-item > .nav-list-link, & > .nav-item > .nav-item-container > .nav-list-link{
        font-size: .88rem;
        padding-left: 0;
        padding-right: 0;
      }

    }

    & > .nav-list-link, & > .nav-item-container > .nav-list-link{
      display: block;
      padding: .96rem .64rem;
      font-size: 1.04rem;
      font-weight: 500;
      color: #FFFFFF;
      letter-spacing: normal;
      line-height: 1;
      text-transform: uppercase;

      & > .nav-list-arrow{
        margin-left: .24rem;
      }

      svg{
        transition: all 0.4s ease;
        fill: #FFFFFF;
      }

      &.selected{ opacity: 1; color: #FFFFFF; }
    }



    & > .desktop-dropdown{
      max-height: unset !important;
      width: auto;
      min-width: 12.8rem;

      & > .desktop-list-subitems{
        background: #FFFFFF;
        -webkit-column-count: unset;
        -webkit-column-gap: unset;
        -moz-column-count: unset;
        -moz-column-gap: unset;
        column-count: unset;
        column-gap: unset;
        padding: 1.28rem 1.6rem calc(1.28rem - 10px);
        width: -moz-fit-content;
        width: fit-content;

        & > .nav-item > .nav-list-link{
          color: #000000;
          border-bottom: 1px solid #FFFFFF;
          font-weight: 400;
          font-size: .96rem;
          letter-spacing: normal;
          margin-bottom: 10px;
          transition: all 0.24s ease;
          display: block;
          width: -moz-fit-content;
          width: fit-content;
          padding: 0;

          &:hover{ border-color: #000000; }
        }

      }

    }

    &.active > .nav-item-container > .nav-list-link, &:hover > .nav-item-container > .nav-list-link,
    &.active > .nav-list-link, &:hover > .nav-list-link{
      color: #FDD00C;   
      svg{ fill: #FDD00C; }
    }

  }

}


@media (min-width: 768px){
  header:not(.compress) .link-logo-header img{ 
    max-height: 4rem; 
  }

  header.compress .link-logo-header img{ 
    max-height: 2.4rem; 
  }
}



.nav-row{ border: 0 none !important; }


{# ------------------------------------------- #}
{# Cabeçalho no Mobile #}
{# ------------------------------------------- #}

@media (max-width: 767px){
  .link-logo-header img{ max-height: 2.4rem; }
}

.btn-menu-mobile{
  padding: 0;
  svg{ fill: #FFFFFF !important; max-height: 1.6rem; }
}

#nav-hamburger{
  background: #FFFFFF;
  z-index: 99999;

  .modal-header{
    background: #000000;
    margin: 0;
    width: 100%;
    display: flex;
    justify-content: flex-end;
    border: 0 none;

    .modal-close{
      border: 1px solid #FFFFFF;
      border-radius: 50%;
      width: 2.4rem;
      height: 2.4rem;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    svg{ fill: #FFFFFF; }

  }

  .modal-body{
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
  }



  .nav-secondary{
    order: 1;
    position: unset;
    width: 100%;
    
    .nav-account{ background: #000000; margin: 0; box-shadow: none; }
    .nav-accounts-link{ color: #FFFFFF; }
    svg{ filter: brightness(0) invert(1); }

  }
   
  .nav-list-link{
    color: #707070;
    border-bottom: 1px solid #000000;
  }

  .js-pages-accordion .nav-list-link{
    background-color: lighten(#000000, 88);
    border-bottom: unset !important;
  }

  .nav-list-arrow svg{ fill: #707070; }

  .nav-primary{
    order: 2;
  }

}




{# ---------------------------------------------------------------------------------------- #}
{# Home #}
{# ---------------------------------------------------------------------------------------- #}

.section-slider{ 
  height: unset;
  
  .swiper-button-prev, .swiper-button-next{
    position: absolute;    
    border-radius: 0;
    width: 2.4rem;
    height: 4.8rem;
    display: flex !important;
    align-items: center;
    justify-content: center;
    border: 0;

    svg{ fill: #707070; transition: fill .4s ease-in-out; }
    &:hover svg{ fill: #000000 }
  }

}


.section-informative-banners{
  margin-bottom: 0 !important;
  padding: 2.08rem 0;
  background: #000000;

  .service-pagination{ margin-top: 0; }

  .service-item-container{ display: flex; align-items: center; }

  .service-item{
    width: 100%;

    @media (max-width: 767px){
      display: flex;
      justify-content: center;
      padding-bottom: .96rem;
    }
  }

  svg{ max-width: 2.88rem; max-height: 2.88rem; width: auto; height: auto; }

  h3, p{
    color: #FFFFFF;
    font-size: .96rem;
    line-height: 1.28rem !important;
    font-weight: 500;
  }


  .swiper-pagination-bullet{ background: #FFFFFF; }

}



.section-featured-home{
  background-image: url('{{ "images/__fundo-featured-home-mobile.jpg" | static_url }}');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  margin-bottom: 0 !important;
  @media (min-width: 768px){ background-image: url('{{ "images/__fundo-featured-home-desktop.jpg" | static_url }}'); }

  .h1{
    margin: 3rem 0;
    color: #FFFFFF;
    font-weight: 500;
    font-size: 2.24rem;
    letter-spacing: .8px;
  }

}


.js-swiper-featured-pagination, .js-swiper-related-pagination{
  position: unset;
  padding-bottom: 3rem;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-wrap: wrap;

  .swiper-pagination-bullet{
    width: 0.8rem;
    height: 0.8rem;
    border-radius: 50%;
    background: #CFCFD2;
    opacity: 1 !important;
    transition: all .4s ease;
    margin: 0.4rem;

    &.swiper-pagination-bullet-active{
      background: #D01C1F;
    }

  }

}


.js-swiper-featured-pagination{

  .swiper-pagination-bullet{
    background: rgba(255, 255, 255, .24);

    &.swiper-pagination-bullet-active{
      background: rgba(255, 255, 255, 1);
    }

  }

}


#section-depoimentos {
  padding-top: 1.68rem;
  padding-bottom: 1.68rem;
  
  .titulo-depoimentos{
    color: #000000;
    font-weight: 500;
    text-align: center;
    font-size: 1.84rem;

    &:before{
      content: "";
      display: block;
      width: 100%;
      height: 2.08rem;
      background-image: url('{{ "images/__detalhe-titulo.svg" | static_url }}');
      background-size: contain;
      background-position: center;
      background-repeat: no-repeat;
      margin-bottom: 0.48rem;
    }

  }

  .foto-autor{
    border-radius: 50%;
    height: 6.4rem;
    width: 6.4rem;
    object-fit: cover;
    object-position: center;
    margin-left: auto;
    margin-right: .48rem;
    border: 3px solid #929292;
  }

  .stars{
    max-height: .96rem;
  }

  .nome-autor{
    color: #929292;
    font-style: normal;
    font-size: 1.04rem;
    line-height: 1;
    font-weight: 500;
    margin: .64rem 0 .4rem;
  }

  .depoimento-autor{
    color: #000000;
    font-size: .88rem;
    line-height: 1.28rem;
  }


  .slick-dots{
    display: flex;
    align-items: center;
    justify-content: center;
    padding: .8rem 0 0;
    position: unset;

    li{
        margin: 0;
        margin: 0 0.56rem;
        display: flex;
        align-items: center;
        border-radius: 50%;
        overflow: hidden;
        justify-content: center;
        &.slick-active button{ background-color: #FDD00C; }
        &:hover button{ background-color: #FDD00C; }
    }

    li > button{
        background-color: #CECECE;
        height: 0.8rem;
        width: 0.8rem;
        border-radius: 50%;
        border: 0;
        opacity: 1 !important;

        &:before{
            content: unset;
        }

    }
  }



}


.section-newsletter-home {
  background-color: #000000;

  h3{
    text-transform: uppercase;
    margin-bottom: 0.4rem;
    font-size: 1.44rem;
    line-height: 1.68rem;
  }

  h4{
    margin-bottom: 0;
    color: #FDD00C;
    font-weight: 500;
    font-size: .848rem;
  }

  @media (min-width: 768px){
    background-image: url('{{ "images/__fundo-newsletter.svg" | static_url }}');
    background-size: contain;
    background-repeat: no-repeat;
    background-position: left-center;
  }

  .form-group{ margin-bottom: 0; }

    .form-control{
      border-radius: 0px;
      color: #000000;
      height: 2.88rem;
      min-height: unset;
      padding: .64rem .96rem;
      font-size: .96rem;
      font-weight: 500;
      border: 0 none;
      transition: color .4s ease;

      &::-webkit-input-placeholder { 
        color: #929292;
        transition: color .4s ease;
      }
      
      &:-moz-placeholder {
        color: #929292;
        transition: color .4s ease;
      }
      &::-moz-placeholder {
        color: #929292;
        transition: color .4s ease;
      }
      &:-ms-input-placeholder {
        color: #929292;
        transition: color .4s ease;
      }

      &:focus{
        &::-webkit-input-placeholder { 
          color: #000000;
        }
        
        &:-moz-placeholder {
          color: #000000;
        }
        &::-moz-placeholder {
          color: #000000;
        }
        &:-ms-input-placeholder {
          color: #000000;
        }
      }
      
    }
  
  .newsletter-btn{
    background: #FDD00C;
    color: #000000;
    transition: all .4s ease;
    font-size: 1.04rem;
    padding: .8rem 1.28rem;
    display: block;
    text-align: center;
    border-radius: 0;
    font-weight: 500;
    opacity: 1 !important;
    height: 2.88rem;

    background-image: url("{{ 'images/__icone-newsletter.svg' | static_url }}") !important;
    background-size: 1.6rem !important;
    background-repeat: no-repeat !important;
    background-position: 1.28rem center !important;
    padding-left: 3.68rem;
    text-align: left;
    width: -moz-fit-content;
    width: fit-content;
    
    &:hover{ background: #F2F2F2; font-weight: 500; }

  }

  .alert{ background: #FFFFFF; font-weight: 500; }

}



{# ---------------------------------------------------------------------------------------- #}
{# Categoria #}
{# ---------------------------------------------------------------------------------------- #}

#nav-filters{
  max-width: 320px;
  border-radius: 0 !important;
  z-index: 99999 !important;

  .modal-header{
    background: rgb(0, 0, 0) !important;
    border-color: rgb(0, 0, 0) !important; 
    color: #FFFFFF !important;

    .modal-close{
      border-color: #FFFFFF !important;
      svg { fill: #FFFFFF !important; }
    }

  }

}

.modal-overlay{
  background: rgba(0, 0, 0, .4) !important;
}

.category-controls{
  position: unset !important;
  padding-bottom: 3rem;
  background-color: transparent !important;

  #btn-filtrar-mbl, .js-sort-by{
    border-radius: 0;
    border: 0 none !important;
    background: #000000;
    color: #FFFFFF;
    transition: background .4s ease;
    padding: 0.72rem 1.44rem;
    min-height: 2.64rem;
    font-size: .8rem;

    @media (min-width: 768px){ font-size: .928rem; }

    svg{ fill: #FDD00C !important; }


    {#
    &:hover{
      background: darken(#fdd00c, 16);
    }
    #}

  }

  .form-select-icon{ background: transparent !important; svg{ max-height: .8rem; fill: #FDD00C; } }

  option{ background: #000000 !important; color: #FFFFFF !important; }

}



{# ---------------------------------------------------------------------------------------- #}
{# Grid de Produto #}
{# ---------------------------------------------------------------------------------------- #}

.item-product{
  text-align: left !important;
  border-radius: 0 !important;
  padding: 0 !important;
  background: #FFFFFF;
  margin-left: .8rem;
  margin-right: .8rem;
  

  &.js-item-product:not(.col-12):not(.col-md-4){
    -ms-flex: 0 0 calc(100% - 1.6rem);
    flex: 0 0 calc(100% - 1.6rem);
    max-width: calc(100% - 1.6rem);
  }

  
  &.js-item-product.col-12.col-md-4{
    -ms-flex: 0 0 calc(100% - 1.6rem);
    flex: 0 0 calc(100% - 1.6rem);
    max-width: calc(100% - 1.6rem);

    @media (min-width: 768px){
      -ms-flex: 0 0 calc(33.333333% - 1.6rem);
      flex: 0 0 calc(33.333333% - 1.6rem);
      max-width: calc(33.333333% - 1.6rem);
    }

  }

  .item-image img{ max-height: 420px !important; }

  .item-description{
    border-bottom: 0 none !important;
    padding: .64rem !important;
    transition: background .4s ease;
  }

  .item-name{
    font-size: 1.04rem;
    text-transform: uppercase;
    color: #929292;
    line-height: 1.32rem;
    font-weight: 400 !important;
    -webkit-line-clamp: unset !important;
  }

  .price-compare{
    color: #929292;
    font-size: .88rem;
    font-weight: 500 !important;
  }

  .item-price{
    color: #000000;
    font-size: 1.44rem;
    line-height: 1;
    margin: 0;
    font-weight: 600;
  }

  .item-installments, .item-installments span{
    font-weight: 500 !important;
    color: #929292;
    font-size: .88rem;
    line-height: .96rem;
  }

  .item-actions{
    visibility: visible !important;
    opacity: 1;
  }

  .item-actions .btn{
    background: #000000;
    color: #FFFFFF;
    border: 0 none;
    transition: opacity 0.4s ease;
    border-radius: 0;
    letter-spacing: normal;
    font-weight: 500;
    line-height: 1;
    margin: 1.6rem auto 0.4rem;
    font-size: 1.12rem;
    text-transform: uppercase;
    padding: 0.56rem 2.88rem;
    
    @media (min-width: 768px){ opacity: 0; }

  }

  .row-data{
    .col-6:first-of-type{ padding-right: 8px; }
    .col-6:last-of-type{ padding-left: 8px; }
  }

  &:hover{ 
    background-color: #EFEFEF;
    .item-actions .btn{ opacity: 1 } 
  }

}


.labels{
  top: unset;
  bottom: 0;
  left: 0;
  width: 100%;

  .lbl-desconto{
    background: #000000;
    border-radius: 0;
    position: absolute;
    right: 0.8rem;
    bottom: 0.8rem;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;

    .js-offer-percentage{
      font-size: 1.28rem;
      padding-right: 0.08rem;
    }

  }

  .lbl-frete-gratis{
    background: #000000;
    border-radius: 0;
    position: absolute;
    left: 0.8rem;
    bottom: 0.8rem;
    text-transform: lowercase;
    display: flex;
    align-items: center;
    font-size: .8rem;
    line-height: .88rem;
    font-weight: 600;
    width: -moz-fit-content !important;
    width: fit-content !important;
    max-width: unset !important;
    min-width: 5.84rem !important;

    &:before{
      content: "";
      display: block;
      width: 1.6rem;
      height: 1.6rem;
      margin-right: 0.64rem;
      background-image: url('{{ "images/_lbl-frete-gratis.svg" | static_url }}');
      background-size: contain;
      background-position: center;
      background-repeat: no-repeat;
    }


  }

}


{# ---------------------------------------------------------------------------------------- #}
{# Detalhe de Produto #}
{# ---------------------------------------------------------------------------------------- #}

#single-product{
  @mixin prefix($property, $value, $prefixes: ()) {
  @each $prefix in $prefixes {
      #{'-' + $prefix + '-' + $property}: $value;
  }
    #{$property}: $value;
}


{# /* // Buttons */ #}


.btn{
  text-decoration: none;
  text-align: center;
  border: 0;
  cursor: pointer;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  text-transform: uppercase;
  background: none;
  @include prefix(transition, all 0.4s ease, webkit ms moz o);
  &:hover,
  &:focus{
    outline: 0;
    opacity: 0.8;
  }
  &[disabled],
  &[disabled]:hover{
    opacity: 0.5;
    cursor: not-allowed;
    outline: 0;
  }
  &-square{
    display: block;
    min-width: 25px;
    min-height: 25px;
    padding: 4px 10px;
    border: 1px solid $main-background;
    outline: 1px solid rgba($main-foreground, .2);
    &:hover{
      outline: 1px solid rgba($main-foreground, .2);
    }
    &.selected{
      outline: 2px solid rgba($primary-color, .5);
    }
  }
}


{# /* // Forms */ #}


input,
textarea {
  font-family: $body-font;
}


.form-control {
  display: block;
  padding: 10px 8px;
  width: 100%;
  border: 0;
  border-bottom: 1px solid rgba($main-foreground, .5);
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  background-color: $main-background;
  &:focus{
    outline: 0;
  }
  &-inline{
    display: inline;
  }
}


.form-control::-webkit-input-placeholder { 
  color: $main-foreground;
}
.form-control:-moz-placeholder {
  color: $main-foreground;
}
.form-control::-moz-placeholder {
  color: $main-foreground;
}
.form-control:-ms-input-placeholder {
  color: $main-foreground;
}


.form-select{
  display: block;
  padding: 10px 0;
  width: 100%;
  border: 0;
  border-bottom: 1px solid rgba($main-foreground, .5);
  border-radius: 0;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  color: $main-foreground;
  background-color: $main-background;
  &-icon{
    background: $main-background;
  }
}
}



#single-product{

  & > .container{
    @media (min-width: 768px){ 
      max-width: unset !important; 
      padding-left: 3rem !important; 
      padding-right: 3rem !important; 
    }
    @media (min-width: 1440px){
      padding-left: 4.8rem !important;
      padding-right: 4.8rem !important;
    }
  }

  .breadcrumbs{
    display: flex;
    align-items:center;

    &:before{
      content: "";
      display: block;
      width: 1.6rem;
      height: 1.6rem;
      background-image: url('{{ "images/__detalhe-titulo.svg" | static_url }}');
      background-size: contain;
      background-position: center;
      background-repeat: no-repeat;
      margin-right: .48rem;
    }

  }

  .product-image-container{
    @media (min-width: 768px){
      max-width: 0 !important;
    }
  }

  .thumb-see-more{
    top: 0;
    left: 0;
  }

  .row-galeria{
    margin-left: -.25rem;
    margin-right: -.25rem;
  }

  .veja-mais img{ margin-bottom: -4px; }

  .box-about{

    .page-header{ 
      margin-bottom: .24rem; 
    }

    .h2{
      color: #000000;
      font-size: 1.84rem;
      line-height: 2.24rem;
      font-weight: 500;
    }

    .ref{
      color: #A4A3A3;
      font-size: .8rem;
      margin-bottom: 1.6rem;
    }

    .btn-square{
      font-size: .88rem;
      min-width: 2.64rem;
      min-height: 2.64rem;
      margin-right: .48rem !important;
      margin-top: .48rem;
      margin-bottom: .48rem !important;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #FFFFFF;
      opacity: 1 !important;
      outline: unset !important;
      font-weight: 500;
      background: #000000;
      border-radius: 50%;
      &.selected, &:hover{
        outline: unset !important;
        color: #FFFFFF;
        background-color: #726F6F;
      }
    }


    #compare_price_display{
      color: #646464;
      margin-bottom: 0;
      font-size: .928rem;
      line-height: 1;
    }

    #price_display{
      color: #000000;
      font-size: 2.48rem;
      font-weight: 700;
      margin-bottom: .928rem;
      line-height: 1;
    }

    .js-max-installments svg{ fill: #000000; }

    .js-max-installments .text-accent{
      color: #000000;
      font-weight: 400 !important; 
      font-size: .928rem;
    }

    #btn-installments{
      color: #000000;
      font-weight: 500;
      font-size: .88rem;
      margin-top: .928rem !important;
      display: flex;
      align-items: center;
      opacity: 1 !important;

      &:before{
        content: "";
        display: inline-block;
        background-image: url("{{ 'images/_parcelamento.svg' | static_url }}");
        background-size: contain;
        background-position: center;
        background-repeat: no-repeat;
        width: 1.44rem;
        height: 1.44rem;
        margin-right: .64rem;    
      }

    }

    #product_form{
      margin-top: 2.4rem;
    }

    .form-label{
      color: #929292;
      font-size: .8rem;
      margin: .4rem 0 0 !important;
    }

    .form-select{
      border-radius: 8px;
    }

    .form-quantity{
      margin-bottom: 0;
      padding: .4rem .8rem !important;
      background: rgba(#FFFFFF, .4);
      border: 1px solid #707070 !important;
      input{ border-color: transparent !important; font-weight: bold; color: #292929; font-size: 1.04rem; padding: .64rem .4rem; }
      svg{ fill: #707070; }
    }

    .js-addtocart{    
      margin: 2.4rem 0 !important;
      background: #000000;
      color: #FFFFFF;
      transition: all .4s ease;
      font-size: 1.36rem;    
      padding: .64rem 4rem;
      display: block;
      text-align: center;
      border-radius: 0;
      opacity: 1 !important;
      width: -moz-fit-content;
      width: fit-content;
      letter-spacing: normal;
      font-weight: 500 !important;
      max-width: 100%;
    
      &:hover{ background: darken(#19BC06, 16); }

      &.nostock{ background: #acacac !important; }

    }


    .shipping-calculator-form{

      .js-shipping-input{
        border: 1px solid #3C3C3C !important;
        height: 2.4rem;
        padding: 0.48rem 1.04rem;
        line-height: .8rem;
        font-size: .8rem;
        color: #000000;
        border-radius: 0;
      }

      .js-calculate-shipping{
        text-transform: none;
        line-height: .8rem;
        font-size: .8rem;
        background: #3C3C3C;
        border: 1px solid #3C3C3C !important;
        border-left: 0 none !important;
        color: #FFFFFF;
        width: -moz-fit-content;
        width: fit-content;
        letter-spacing: normal;
        margin-left: -30px;
        border-radius: 0;
        height: 2.4rem;
        padding: .48rem 1.04rem;       
        opacity: 1 !important; 
        {# &:hover{ color: #000000; } #}

      }
    }

  }

  .js-shipping-list-item .radio-button-content {
    background: #FFFFFF;
  }

  .js-store-branches-container{ background: #FFFFFF; }

  .js-store-branches-container .box:last-of-type{
    margin-bottom: 3.2rem !important;
  }

  .product-description{

    h2, h3, h4, h5, h6{
      color: #000000;
      line-height: 1;
      font-size: 1.44rem;
      font-weight: 700;
      margin-bottom: 1.84rem !important;
      padding-bottom: 1.28rem;
      position: relative;

      &:after{
        content: "";
        display: block;
        background: #726F6F;
        height: 4px;
        width: 12.8rem;
        position: absolute;
        bottom: 0;
        left: 0;
      }

    }

    p, li{
      font-size: .88rem;
      line-height: 1.84rem;
      color: #000000;
    }

    p{ margin-bottom: 0; }
  }

}


#related-products{
  margin-bottom: 0;

  & > .container{
    @media (min-width: 768px){ 
      max-width: unset !important; 
      padding-left: 3rem !important; 
      padding-right: 3rem !important; 
    }
    @media (min-width: 1440px){
      padding-left: 4.8rem !important;
      padding-right: 4.8rem !important;
    }
  }


  .h1{
    color: #000000;
    text-transform: uppercase;
    text-align: left;
    font-size: 1.68rem;
    font-weight: 600;
    border-bottom: 1px solid #9A9A9A;
    padding-bottom: 0.8rem;
  }

  .js-swiper-related-pagination{

    .swiper-pagination-bullet{
      background: rgba(0, 0, 0, .24);

      &.swiper-pagination-bullet-active{
        background: rgba(0, 0, 0, 1);
      }

    }

  }


}




.header-product, .footer-product, .footer-product .footer-legal{
  & > .container{
    @media (min-width: 768px){ 
      max-width: unset !important; 
      padding-left: 3rem !important; 
      padding-right: 3rem !important; 
    }
    @media (min-width: 1440px){
      padding-left: 4.8rem !important;
      padding-right: 4.8rem !important;
    }
  }
} 


{# ---------------------------------------------------------------------------------------- #}
{# Footer #}
{# ---------------------------------------------------------------------------------------- #}

.footer{
  color: #FFFFFF;
	background-color: #313131;
  margin-top: 0;
  padding-top: 0;
}

.footer .h3{
  color: #929292;
  font-size: 1.04rem;
  font-weight: 600;
  text-transform: uppercase;
}


.col-menu-footer{

  .footer-menu{
    margin-bottom: 0 !important;

    .footer-menu-item{ 
      margin-bottom: 0.96rem;
      padding-right: 0.64rem;
      display: inline-block;
    }

    h3{
      text-transform: uppercase;
      color: #FDD00C;
      font-weight: 600;
      margin-bottom: 0;
      font-size: 1.12rem;
    }

    .footer-menu-link{
      font-size: .88rem;
      transition: all .4s ease;
      color: #FFFFFF;
      border-bottom: 1px solid #313131;
      width: -moz-fit-content;
      width: fit-content;

      &:hover{ color: #FDD00C; border-color: #FDD00C; }

    }

  }

}



.footer .contact-info{
	margin: 0;
	padding: 0;
	
	svg{
		width: 1.44rem;
		height: 1.44rem;
		margin-right: .64rem;
    fill: #FFFFFF;
	}

  .contact-item{ 
    margin-bottom: .8rem; 
    position: unset; 
    padding-left: 0; 
    display: flex; 
    align-items: center; 
  }
  
  .contact-item.li-address{ display: none !important; }

  .contact-item-icon{
    position: unset !important;
  }
  
  .contact-link{
    color: #FFFFFF;
    font-size: .88rem;
  }
	
}

.ctt-item-wpp{
  flex-wrap: wrap;
  &:before{
    content: "Whatsapp";
    display: block;
    width: 100%;
    padding-left: 2.08rem;
    color: #FDD00C;
    font-size: .8rem;
    font-weight: 500;
  }
}
	
.redes-sociais-rodape{

	.social-icon-rounded{
    background: rgba(0, 0, 0, 0);
    
    svg{
      width: 1.84rem;
      height: auto;
      fill: #FDD00C;
    }

	}
	
}


.footer-legal {
	background: #313131;
	color: #FFFFFF;
  font-size: .72rem !important;
  padding: 0 !important;
  position: relative;

  &:before{
    content: "";
    display: block;
    width: 16rem;
    height: 1px;
    background-color: #707070;
    position: absolute;
    left: calc(50% - 8rem);
    top: 0;
  }
	
  .weethub{
    svg{
      fill: #FFCC00;
      max-height: 0.64rem;
    }

    a{
      color: #FFFFFF;
      border-bottom: 1px solid #313131;
      transition: all .4s ease;
      &:hover{
        color: #FFCC00;
        border-bottom: 1px solid #FFCC00;
      }
    }
  }

  .nuvem a{
      color: #FFFFFF;
      border-bottom: 1px solid #313131;
      transition: all .4s ease;
      &:hover{
        border-bottom: 1px solid #FFFFFF;
      }
  }

}




{# ---------------------------------------------------------------------------------------- #}
{# Pagina Fale Conosco #}
{# ---------------------------------------------------------------------------------------- #}

.contact-page{

  .info-pag-contato{

    p, li{
      font-size: .96rem;
      line-height: 1.84rem;
      color: #000000;
    }

    .contact-link{ color: #000000; }

    svg{
      width: 1.6rem;
      height: auto;
      fill: #000000;
      & [fill="#fff"], & * [fill="#fff"]{ fill: #000000; }
      & [stroke="#fff"], & * [stroke="#fff"]{ stroke: #000000; }
    }
    
    .contact-item{
      margin-bottom: 1.6rem;
      padding-left: 2.48rem;
    }


  }

  .alert{ background: #FFFFFF; font-weight: 500; }

}


{# ---------------------------------------------------------------------------------------- #}
{# Paginas Customizadas #}
{# ---------------------------------------------------------------------------------------- #}


.titulo{
  text-transform: uppercase;
  color: #000000;
  font-size: 1.84rem;
  font-weight: 500;
  margin-bottom: 0;
  text-align: left;
  display: flex;
  align-items: center;
  
  &:before{
    content: "";
    display: block;
    width: 2.4rem;
    height: 2.4rem;
    background-image: url('{{ "images/__detalhe-titulo.svg" | static_url }}');
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
    margin-right: .8rem;
  }

}

.page-custom{

  &__content p , &__content li{
    font-size: .96rem;
    line-height: 1.84rem;
    color: #000000;
  }

  &__content p{ margin-bottom: 1.28rem; }

  &__content h2, &__content h3, &__content h4{
    color: #000000;
    font-weight: 600;
    margin-bottom: 1.2rem;
  }

  img{
    height: auto !important;
    width: auto !important;
    max-width: 100% !important;
    display: block;
  }

}

form.form{

  input.form-control, select.form-control, textarea.form-control{
    border: 1px solid #B7B7B7;
    border-radius: 0;
    color: #000000;
    font-size: .96rem;
    font-weight: 500;

    &::-webkit-input-placeholder { 
      color: #707070;
    }
    
    &:-moz-placeholder {
      color: #707070;
    }
    &::-moz-placeholder {
      color: #707070;
    }
    &:-ms-input-placeholder {
      color: #707070;
    }

    &:placeholder{
      color: #707070;        
    }

    &:focus{
      border-color: #000000;

      &::-webkit-input-placeholder { 
        color: #000000;
      }
      
      &:-moz-placeholder {
        color: #000000;
      }
      &::-moz-placeholder {
        color: #000000;
      }
      &:-ms-input-placeholder {
        color: #000000;
      }

    }

  }

  button.btn-primary{
    background-color: #000000;
    color: #FFFFFF;
    transition: all .4s ease;
    font-size: 1.12rem;
    padding: .64rem 3.2rem;
    opacity: 1 !important;
    border-radius: 0 !important;
    margin-bottom: 1.2rem;
    letter-spacing: normal;
    font-weight: 600;
    text-transform: uppercase;

    &:hover{ background-color: #FDD00C; color: #000000; }

  }

}


.breadcrumbs{
  color: #707070;
  font-size: .88rem;

  .crumb{
    opacity: 1;
    font-size: .88rem;
    color: #707070;
    border-bottom: 1px solid #F2F2F2;
    &:hover{ color: #000000; border-color: #000000; }
  }

}

.btn-primary{
  background-color: #000000 !important;
  color: #FFFFFF !important;
  &:hover{
    background-color: #FDD00C !important;
    color: #000000 !important;  
  }
}

.account-page {
  margin-bottom: 0 !important;
  padding-bottom: 3rem !important  
}

.notification-fixed-bottom {
  .text-foreground{ color: #000000 !important; }
  .js-notification-close{ background-color: #000000 !important; }
}