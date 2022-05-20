{# Payments details #}

<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container" data-variants="{{product.variants_object | json_encode }}">
    <div class="container">
        <div class="row section-single-product mb-0">

            <div class="col-md-12">
                {% include "snipplets/breadcrumbs.tpl" %}        
            </div>

            <div class="col-md-7 mb-0 mb-md-5">
            	{% include 'snipplets/product/product-image.tpl' %}


                <div class="d-none d-md-block pl-md-5">
                    <div id="product-description" style="display: none;" class="mt-4 mt-md-1" data-store="product-description-{{ product.id }}">
                        {# Product description #}
                        {% if product.description is not empty %}
                            <div class="product-description user-content">
                                <h2 class="mt-5">Descrição</h2>
                                {{ product.description }}
                            </div>
                        {% endif %}
                    </div>
                </div>

            </div>


            <div class="col-md-5 mb-5" data-store="product-info-{{ product.id }}">
                <div class="box-about pr-md-5 pl-md-4">
                	{% include 'snipplets/product/product-form.tpl' %}
                </div>                
            </div>


            <div class="col-12 d-md-none">
                <div id="product-description" style="display: none;" class="mt-4 mt-md-1" data-store="product-description-{{ product.id }}">
                    {# Product description #}
                    {% if product.description is not empty %}
                        <div class="product-description user-content">
                            <h2 class="mt-5">Descrição</h2>
                            {{ product.description }}
                        </div>
                    {% endif %}
                </div>
            </div>

        </div>


    </div>
</div>

{# Related products #}
{% include 'snipplets/product/product-related.tpl' %}

{#  **** Newsletter ****  #}
{% include 'snipplets/newsletter.tpl' %}