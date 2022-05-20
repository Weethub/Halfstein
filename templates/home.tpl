{% set show_help = not (settings.slider | length) and not (settings.video_embed or settings.show_instafeed) and not has_products %}

{% set help_url = has_products ? '/admin/products/feature/' : '/admin/products/new/' %}

{# **** This will show default products in the home page before you upload some products **** #}
{% if show_help %}
    {% snipplet 'defaults/show_help.tpl' %}
{% else %}

	{# END of show default products in the home page #}

	{#  **** Home slider ****  #}

	{% set has_mobile_slider = settings.toggle_slider_mobile and settings.slider_mobile and settings.slider_mobile is not empty %}
	
	<section data-store="slider-main">
		{% include 'snipplets/home/home-slider.tpl' %}
		{#
		{% if has_mobile_slider %}
			{% include 'snipplets/home/home-slider.tpl' with {mobile: true} %}
		{% endif %}
		#}
	</section>


	{#  **** Features Order ****  #}
	{% set newArray = [] %}

	{% for section in ['home_order_position_1', 'home_order_position_2', 'home_order_position_3', 'home_order_position_4', 'home_order_position_5', 'home_order_position_6', 'home_order_position_7', 'home_order_position_8', 'home_order_position_9',  'home_order_position_10'] %}
	    {% set section_select = attribute(settings,"#{section}") %}

	    {% if section_select not in newArray %}

		    {% if section_select == 'products' %}

				{#  **** Featured products ****  #}
				{% include 'snipplets/home/home-featured-products.tpl' with {'has_featured': true} %}

		    {% elseif section_select == 'informatives' %}

				{#  **** Informative banners ****  #}
				{% include 'snipplets/banner-services/banner-services.tpl' %}

			{% elseif section_select == 'grade_banners' %}

				{% include 'snipplets/home/home-grade.tpl' %}

			{% elseif section_select == 'banner_destacado' %}

				{% include 'snipplets/home/home-banners-destaque.tpl' %}

			{% elseif section_select == 'banner_promocional' %}

				{#  **** Promotional banners ****  #}
				{% include 'snipplets/home/home-promotional.tpl' %}

			{% elseif section_select == 'newsletter' %}

				{#  **** Newsletter ****  #}
				{% include 'snipplets/newsletter.tpl' %}

			{% elseif section_select == 'depoimentos_video' %}

				<div class="row no-gutters">
					<div class="col-md-6">
						{% include 'snipplets/home/home-depoimentos.tpl' %}
					</div>
					<div class="col-md-6">
						{% include 'snipplets/home/home-video.tpl' %}
					</div>
				</div>

		    {% endif %}

	   {% set newArray = newArray|merge([section_select]) %}
	   
	   {% endif %}

	{% endfor %}

	{% if settings.home_promotional_popup %}
		{% include 'snipplets/home/home-popup.tpl' %}
	{% endif %}

{% endif %}
