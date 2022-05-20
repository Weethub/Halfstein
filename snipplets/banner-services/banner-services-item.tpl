<div class="service-item-container col-md swiper-slide p-0 px-md-3">
    <div class="service-item mx-4 mx-md-0">

        <div class="row align-items-center">
            <div class="col-auto">
                
                {% if banner_services_icon == 'personalizado_1' %}
                    {% include "snipplets/svg/_personalizado-1.tpl" with {svg_custom_class: "icon-inline icon-5x svg-icon-text"} %}
                {% elseif banner_services_icon == 'personalizado_2' %}
                    {% include "snipplets/svg/_personalizado-2.tpl" with {svg_custom_class: "icon-inline icon-5x svg-icon-text"} %}
                {% elseif banner_services_icon == 'personalizado_3' %}
                    {% include "snipplets/svg/_personalizado-3.tpl" with {svg_custom_class: "icon-inline icon-5x svg-icon-text"} %}
                {% elseif banner_services_icon == 'personalizado_4' %}
                    {% include "snipplets/svg/_personalizado-4.tpl" with {svg_custom_class: "icon-inline icon-5x svg-icon-text"} %}
                {% endif %}
                
            </div>
            <div class="col p-0">
                <h3 class="h5 m-0">{{ banner_services_title }}</h3>
                <p class="m-0">{{ banner_services_description }}</p>
            </div>
        </div>

    </div>
</div>
