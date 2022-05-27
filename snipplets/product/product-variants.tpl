<div class="js-product-variants form-row">
    {% set has_size_variations = false %}
    {# Color and size variants buttons #}
      
      {% for variation in product.variations if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size'] %}
          <div class="col-12">
            <div data-variant="{{ variation.name }}" class="js-btn-variation-container mb-2">
              <label for="variation_{{loop.index}}" class="form-label mb-3">{{variation.name}}: 
                <strong class="js-insta-variation-label">{{ product.default_options[variation.id] }}</strong>
              </label>
              <div class="row no-gutters">
                {% for option in variation.options if option.custom_data %}
                <div class="col-auto">
                    <a data-option="{{ option.id }}" class="js-btn-variation btn btn-square mr-2 mb-3 {{ variation.name }} {% if product.default_options[variation.id] == option.id %} selected {% endif %}" style="background: {{ option.custom_data }}" data-name="{{ option.name }}">
                    </a>
                </div>
                {% endfor %}
                {% for option in variation.options if not option.custom_data %}
                <div class="col-auto">
                    <a data-option="{{ option.id }}" class="js-btn-variation btn btn-square mr-2 mb-3 {{ variation.name }} {% if product.default_options[variation.id] == option.id %} selected {% endif %}" data-name="{{ option.name }}">
                        {{ option.name }}
                    </a>
                </div>
                {% endfor %}
              </div>
            </div>
        </div>

		{% if variation.name in ['Talle', 'Talla', 'Tamanho', 'Size'] %}
			{% set has_size_variations = true %}
		{% endif %}

    {% endfor %}


    {# Variants selects (for color and sizes the select is still working but hidden)  #}


    {% for variation in product.variations %}
        <div class="{% if loop.length == 3 %} col-12 col-sm-4 {% elseif loop.length == 2 %} col-6 {% else %} col col-sm-6{% endif %}" {% if variation.name in ['Color', 'Cor', 'Talle', 'Tamanho', 'Size']%}style="display: none"{% endif %}>
            {% embed "snipplets/forms/form-select.tpl" with{select_label: true, select_label_name: '' ~ variation.name ~ '', select_for: 'variation_' ~ loop.index , select_id: 'variation_' ~ loop.index, select_name: 'variation' ~ '[' ~ variation.id ~ ']', select_custom_class: 'js-variation-option js-refresh-installment-data'} %}
                {% block select_options %}
                    {% for option in variation.options %}
                        <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                    {% endfor %}
                {% endblock select_options%}
            {% endembed %}
        </div>

        {% if variation.name in ['Talle', 'Talla', 'Tamanho', 'Size'] %}
			{% set has_size_variations = true %}
		{% endif %}

    {% endfor %}

	{% if show_size_guide and settings.size_guide_url and has_size_variations %}
		{% set has_size_guide_page_finded = false %}
		{% set size_guide_url_handle = settings.size_guide_url | trim('/') | split('/') | last %}

		{% for page in pages if page.handle == size_guide_url_handle and not has_size_guide_page_finded %}
			{% set has_size_guide_page_finded = true %}
			{% if has_size_guide_page_finded %}
				<a data-toggle="#size-guide-modal" data-modal-url="modal-fullscreen-size-guide" class="js-modal-open js-fullscreen-modal-open btn-link btn-link-primary font-small col-12 mb-2">
					{% include "snipplets/svg/arrows-h.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-primary mr-1"} %}
					{{ 'Guía de talles' | translate }}
				</a>
				{% embed "snipplets/modal.tpl" with{modal_id: 'size-guide-modal',modal_class: 'bottom-md', modal_position: 'right', modal_transition: 'slide', modal_header: true, modal_footer: true, modal_width: 'centered', modal_mobile_full_screen: 'true'} %}
					{% block modal_head %}
						{{ 'Guía de talles' | translate }}
					{% endblock %}
					{% block modal_body %}
						<div class="user-content">
							{{ page.content }}
						</div>
					{% endblock %}
				{% endembed %}
			{% endif %}
		{% endfor %}
	{% endif %}


</div>