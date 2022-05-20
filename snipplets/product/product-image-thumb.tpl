<div class="col-6 p-1" style="overflow: hidden">

    <div style="overflow: hidden; position: relative;">

        {% if loop.last and last_open_modal %}
            <a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-block position-relative veja-mais">

                <img src="{{ image | product_image_url('original') }}" class="img-fluid" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                {% set remaining_imgs = product.images_count - (loop.index - 1)%}
                <div class="thumb-see-more">
                    <span class="h1 font-weight-normal">+{{ remaining_imgs }}</span>
                </div>

            </a>
        {% else %}


            <a href="{{ image | product_image_url('original') }}" data-fancybox="product-gallery" class="js-product-slide-link d-none">
                <img src="{{ image | product_image_url('original') }}" class="img-fluid" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
            </a>


            <div style="position: relative; overflow: hidden">
                <div class="slider-slide product-slide" data-image="{{image.id}}" data-image-position="{{loop.index0}}" data-zoom-url="{{ image | product_image_url('huge') }}">
                    <a href="{{ image | product_image_url('original') }}" class="js-desktop-zoom cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'" style="padding-bottom: {{ image.dimensions['height'] / image.dimensions['width'] * 100}}%;">
                        <img data-sizes="auto" src="{{ image | product_image_url('small') }}" data-srcset='{{  image | product_image_url('large') }} 480w, {{  image | product_image_url('huge') }} 640w' class="js-product-slide-img js-image-open-mobile-zoom product-slider-image img-absolute img-absolute-centered lazyautosizes lazyload" {% if image.alt %}alt="{{image.alt}}"{% endif %} />
                    </a>
                </div>
            </div>

        {% endif %}

    </div>

</div>