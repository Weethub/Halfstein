{% if settings.testimonials %}
	<section id="section-depoimentos">
		<div class="container">
		
			<h2 class="titulo-depoimentos mb-4">{{ settings.depoimentos_titulo }}</h2>

			<ul class="depo list-unstyled mb-0 pl-0">
			
				{% for dep in settings.testimonials %}
				
					<li class="mx-1 mx-md-3 mb-2 pb-3 px-md-3">
						<blockquote class="row my-0 no-gutters">
							
							<div class="col-3 pr-2 d-none d-xl-block">
								<img src="{{ dep.image | static_url }}" class="img-fluid foto-autor" alt="Foto de {{ dep.title}}">
							</div>

							<div class="col-xl-9 pl-xl-2">
								<img src="{{ 'images/stars.svg' | static_url }}" class="img-fluid stars">
								<cite class="nome-autor d-block">{{ dep.title }}</cite>
							
								<p class="depoimento-autor mb-0">
									{{ dep.description }} 
								</p>
							
							</div>

						</blockquote>
					</li>

				{% endfor %}
								
			</ul>

		</div>
	</section>
{% endif %}