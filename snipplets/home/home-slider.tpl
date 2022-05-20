
<section class="js-home-slider-container d-none d-sm-block">
	<div class="container-fluid">
        <div class="row">
        	<div class="col section-slider p-0">
				<div class="js-home-slider nube-slider-home swiper-container">
				    <div class="swiper-wrapper">
				        {% for slide in settings.slider %}
			                <div class="swiper-slide slide-container">
			                	{% if slide.link %}
			                		<a href="{{ slide.link }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
			                	{% endif %}	
			                	
			                	<div class="slider-slide">
			                		<img {% if loop.index == 1 %}src="{{ slide.image | static_url | settings_image_url('original') }}" srcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="slider-image"{% else %}data-src="{{ slide.image | static_url | settings_image_url('original') }}" data-srcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w"class="slider-image swiper-lazy"{% endif %}>
			                		
					            </div>
					            
					            {% if slide.link %}
					            	</a>
					            {% endif %}
			            	</div>
				        {% endfor %}
				    </div>
				    <div class="js-swiper-home-pagination swiper-pagination swiper-pagination-white d-block d-md-none"></div>
				    <div class="js-swiper-home-prev swiper-button-prev svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-2x mr-1"} %}</div>
			        <div class="js-swiper-home-next swiper-button-next svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-2x ml-1"} %}</div>
				</div>
			</div>
		</div>
	</div> 
</section>


<section class="js-home-slider-container d-sm-none">
	<div class="container-fluid">
        <div class="row">
        	<div class="col section-slider p-0">
				<div class="js-home-slider nube-slider-home swiper-container">
				    <div class="swiper-wrapper">
				        {% for slide in settings.slider_mobile %}
			                <div class="swiper-slide slide-container">
			                	{% if slide.link %}
			                		<a href="{{ slide.link }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
			                	{% endif %}	
			                	
			                	<div class="slider-slide">
			                		<img {% if loop.index == 1 %}src="{{ slide.image | static_url | settings_image_url('original') }}" srcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w" class="slider-image"{% else %}data-src="{{ slide.image | static_url | settings_image_url('original') }}" data-srcset="{{ slide.image | static_url | settings_image_url('original') }} 1024w, {{ slide.image | static_url | settings_image_url('1080p') }} 1920w"class="slider-image swiper-lazy"{% endif %}>
			                		
					            </div>
					            
					            {% if slide.link %}
					            	</a>
					            {% endif %}
			            	</div>
				        {% endfor %}
				    </div>
				    <div class="js-swiper-home-pagination swiper-pagination swiper-pagination-white d-none"></div>
				    <div class="js-swiper-home-prev swiper-button-prev svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-2x mr-1"} %}</div>
			        <div class="js-swiper-home-next swiper-button-next svg-icon-text">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-2x ml-1"} %}</div>
				</div>
			</div>
		</div>
	</div>
</section>