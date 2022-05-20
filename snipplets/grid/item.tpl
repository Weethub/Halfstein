{# /*============================================================================
  #Item grid
==============================================================================*/

#Properties

#Slide Item

#}

{% set slide_item = slide_item | default(false) %}
{% set columns = settings.grid_columns %}
{% set has_color_variant = false %}
{% if settings.product_color_variants %}
    {% for variation in product.variations if variation.name in ['Color', 'Cor'] and variation.options | length > 1 %}
        {% set has_color_variant = true %}
    {% endfor %}
{% endif %}

{% if slide_item %}
    <div class="swiper-slide{% if settings.theme_rounded %} p-3{% endif %}">
{% endif %}
{% if settings.theme_rounded %}
    <div class="js-item-product {% if not slide_item %}col-12 col-md-4{% endif %} mb-5 align-self-start" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}">
        <div class="item item-rounded item-product box-rounded p-0">
{% else %}
    <div class="js-item-product {% if not slide_item %}col-12 col-md-4{% endif %} mb-5 item item-product align-self-start" data-product-type="list" data-product-id="{{ product.id }}" data-store="product-item-{{ product.id }}">
{% endif %}
        {% if settings.quick_shop or settings.product_color_variants %}
            <div id="quick{{ product.id }}{% if slide_item and section_name %}-{{ section_name }}{% endif %}" class="js-product-container js-quickshop-container position-relative {% if product.variations %}js-quickshop-has-variants{% endif %}" data-variants="{{ product.variants_object | json_encode }}">
        {% endif %}
        {% set product_url_with_selected_variant = has_filters ?  ( product.url | add_param('variant', product.selected_or_first_available_variant.id)) : product.url  %}

        {% if has_color_variant %}

            {# Item image will be the first avaiable variant #}

            {% set item_img_spacing = product.featured_variant_image.dimensions['height'] / product.featured_variant_image.dimensions['width'] * 100 %}
            {% set item_img_srcset = product.featured_variant_image %}
            {% set item_img_alt = product.featured_variant_image.alt %}
        {% else %}

            {# Item image will be the first image regardless the variant #}

            {% set item_img_spacing = product.featured_image.dimensions['height'] / product.featured_image.dimensions['width'] * 100 %}
            {% set item_img_srcset = product.featured_image %}
            {% set item_img_alt = product.featured_image.alt %}
        {% endif %}
        <div class="item-image{% if columns == 1 %} item-image-big{% endif %}">
            <div style="padding-bottom: {{ item_img_spacing }}%;" class="position-relative" data-store="product-item-image-{{ product.id }}">
                <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" >
                    
                    <img alt="{{ product.featured_image.alt }}" data-sizes="auto" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ product.featured_image | product_image_url('small')}} 240w, {{ product.featured_image | product_image_url('medium')}} 320w, {{ product.featured_image | product_image_url('large')}} 480w" class="lazyautosizes lazyload img-absolute img-absolute-centered{% if settings.product_hover and product.other_images %} item-image-primary{% endif %}" />

                    {# Low quality img until final img is lazyloaded #}
                        <img alt="{{ product.featured_image.alt }}" src="{{ product.featured_image | product_image_url('tiny')}}" class="img-absolute img-absolute-centered blur-up">

                    {% if settings.product_hover and product.other_images %}
                        <img alt="{{ product.featured_image.alt }}" data-sizes="auto" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ product.other_images | first | product_image_url('small')}} 240w, {{ product.other_images | first | product_image_url('medium')}} 320w, {{ product.other_images | first | product_image_url('large')}} 480w" class="lazyautosizes lazyload img-absolute img-absolute-centered item-image-secondary" />
                    {% endif %}

                    <div class="placeholder-fade">
                    </div>
                </a>
            </div>
            
            {% if settings.product_color_variants %}
                {% include 'snipplets/labels.tpl' with {color: true} %}
                {% include 'snipplets/grid/item-colors.tpl' %}
            {% else %}
                {% include 'snipplets/labels.tpl' %}
            {% endif %}
            
            {% if (settings.quick_shop or settings.product_color_variants) and product.variations %}
                <div class="item-buy{% if settings.product_color_variants and not settings.quick_shop %} hidden{% endif %}">
                    <div class="js-item-variants item-buy-variants{% if settings.theme_rounded %} px-1 py-2 p-md-3{% endif %}">
                        <form class="js-product-form" method="post" action="{{ store.cart_url }}">
                            <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                            {% if product.variations %}
                                {% include "snipplets/product/product-variants.tpl" with {quickshop: true} %}
                            {% endif %}
                            {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                            {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                            {# Add to cart CTA #}

                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-small w-100 mb-2 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                            {# Fake add to cart CTA visible during add to cart event #}

                            <div class="js-addtocart js-addtocart-placeholder btn btn-primary btn-block btn-transition btn-small w-100 mb-2 disabled" style="display: none;">
                                <span class="js-addtocart-text">{{ 'Agregar al carrito' | translate }}</span>
                                <span class="js-addtocart-success transition-container btn-transition-success-small">
                                    {% include "snipplets/svg/check-circle.tpl" with {svg_custom_class: "icon-inline svg-icon-invert btn-transition-success-icon"} %}
                                </span>
                                <div class="js-addtocart-adding transition-container transition-soft btn-transition-progress">
                                    <div class="spinner-ellipsis invert">
                                        <div class="point"></div>
                                        <div class="point"></div>
                                        <div class="point"></div>
                                        <div class="point"></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <a href="#" class="js-item-buy-close">
                            {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline icon-lg svg-circle svg-icon-text"} %}
                        </a>
                    </div>
                </div>
            {% endif %}
        </div>
        <div class="item-description pt-4 px-1" data-store="product-item-info-{{ product.id }}">
            
            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">
                <div class="js-item-name item-name mb-3 text-center text-md-left" data-store="product-item-name-{{ product.id }}">{{ product.name }}</div>
            </a>


            <a href="{{ product_url_with_selected_variant }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="item-link">
                {% if product.display_price %}
                    <div class="item-price-container mb-1" data-store="product-item-price-{{ product.id }}">
                        <span class="js-compare-price-display price-compare" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %}style="display:inline-block;"{% endif %}>
                            {{ product.compare_at_price | money }}
                        </span>
                        <span class="js-price-display item-price">
                            {{ product.price | money }}
                        </span>
                    </div>
                    {% include 'snipplets/payments/installments.tpl' %}
                {% endif %}
            </a>
        
            {% if template != 'home' %}    
                <div class="item-actions d-flex justify-content-center justify-content-md-end text-right mt-3 mt-md-0"> 
                    <a href="{{ product.url }}" title="{{ product.name }}" aria-label="{{ product.name }}" class="d-flex align-items-center justify-content-center btn btn-secondary btn-small"><span>Comprar</span></a>
                </div>    
            {% endif %}
                
        </div>
        
        {% if settings.quick_shop or settings.product_color_variants %}
            </div>{# This closes the quickshop tag #}
        {% endif %}

        {# Structured data to provide information for Google about the product content #}
        {% include 'snipplets/structured_data/item-structured-data.tpl' %}
    </div>
{% if settings.theme_rounded %}
    </div>
{% endif %}
{% if slide_item %}
    </div>
{% endif %}