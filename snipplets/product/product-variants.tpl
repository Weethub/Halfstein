<div class="js-product-variants form-row">
    
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
    {% endfor %}
</div>