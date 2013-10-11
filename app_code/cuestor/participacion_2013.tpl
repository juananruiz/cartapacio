<div id="contenedor_errores" class="alert-error" style="margin-top:10px;display:none"></div>
<ul id="tab" class="nav nav-tabs">
	<li class="active"><a href="#inicio" data-toggle="tab">Inicio</a></li>
	<li class=""><a href="#pag1" data-toggle="tab">Base 1</a></li>
	<li class=""><a href="#pag2" data-toggle="tab">Base 2</a></li>
	<li class=""><a href="#pag3y4" data-toggle="tab">Base 3 y 4</a></li>
	<li class=""><a href="#pag5" data-toggle="tab">Base 5</a></li>
	<li class=""><a href="#pag6" data-toggle="tab">Base 6</a></li>
	<li class="laststep"><a href="#pag7" data-toggle="tab">Aportaciones personales</a></li>
</ul>

<form action="index.php?page=cuestor/cuestionario_enviar&id_envio={$envio->id}&id_cuestionario={$cuestionario->id}" method="POST"enctype="multipart/form-data" id="cuestionario">
	<div id="myTabContent" class="tab-content">
		<!-- página inicio -->
		<div class="tab-pane fade active in" id="inicio">
			<div class="row-fluid">
				<div class="span4">
					<h4>Descripción</h4>
					<p>En el I Plan Propio del PAS se señala a la participación como una de las principales vías para la incorporación de las aportaciones de las personas a la estrategia conjunta de la Organización. Para ello, la Dirección de RRHH va a desarrollar una sistemática que permita formalizar los diferentes mecanismos de participación y gestionar adecuadamente sus resultados. El reconocimiento a las personas será el principal estímulo para que todos nos animemos a mostrar nuestros intereses, nuestras preocupaciones y para que nuestra experiencia y profesionalidad tenga el valor que le corresponde.</p>
					 
					<p><a target="_blank" href="https://www.r2h2.us.es/uploads/Intranet/planificacion/I%20Plan%20Propio%20PAS%20PROPUESTA%20A%20RECTOR%20y%20DEFINITIVA.pdf" class="btn"><i class="icon-download-alt"></i> Descargar I Plan Propio del PAS</a></p>
				</div>
				<div class="span4">
					<h4>Compromiso</h4>
					<div class="well well-mini">
					<p><b>Manifiesto mi voluntad de participar en los diferentes mecanismos de participación (grupos de trabajo, grupos de discusión, sugerencias, …) que puedan ser de mi interés, ofreciendo así mi experiencia, profesionalidad y conocimientos tanto a la Organización como al resto de compañeros.</b></p> 
					<p style="margin-left:20px">{include file="cuestor/opcion_1.tpl" disabled="false" id_pregunta="1"}</p>
					</div>
					<p>A continuación, puedes iniciar tu participación respondiendo a una serie de cuestiones planteadas en relación al despliegue del I Plan Propio del PAS. Este primer proyecto consiste en una recopilación de expectativas para ir dando forma a las diversas actuaciones que darán despliegue el I Plan Propio del PAS y para dar por cerrado el diagnóstico de cultura organizacional iniciado en noviembre de 2012, en el que, sustituyendo a las anteriores encuestas de clima, participó más del 90% de la plantilla.</p>
				<p style="margin-top:2em;"><input type="button" class="btn btnNext btn-large" value="Comenzar" ></a>
				</div>
				<div class="span4">
					<img src="images/conversaciones.jpg" alt="personas participando">
					<p style="margin-top:10px">Tu participación ha comenzado el {$envio->fecha_inicio|date_format:"%d/%m/%Y"}{if $envio->fecha_fin != NULL}, y ha finalizado el {$envio->fecha_fin|date_format:"%d/%m/%Y"} {/if}</p>
				</div>
			</div> 
			<div class="span12">
			</div>
	</div>
	<!-- fin pagina inicio -->

	<!-- inicio página 1 -->
	<div class="tab-pane fade" id="pag1">
		<h4>Participación, comunicación y reconocimiento.</h4>
		<p>Conforme al I Plan Propio del PAS, vamos a diseñar un Plan de Comunicación Interna para que las personas de la Administración y Servicios de la US cuenten con toda la información necesaria acerca de nuestra realidad profesional y social y pueda, asimismo, desarrollar una opinión personal propia. Vamos a establecer, además, una sistemática formal que permitirá conocer los mecanismos de participación disponibles, los objetivos asignados a cada cual y las personas que participan en cada uno de ellos. Estos objetivos se verán recompensados en la medida que corresponde, con una sistemática de reconocimiento que anime y motive a las personas a integrarse en una organización moderna al servicio del interés público. Ayúdanos a hacerlo dándonos tu opinión en relación a las siguientes cuestiones:</p>
		<div class="well well-mini">
			<h5><span class="">1.1</span> La Dirección de RRHH está activando una sistemática de participación que permitirá a todas las personas incorporar sus ideas, opiniones y, sobre todo, su conocimiento profesional, a los mecanismos de toma de decisión. Valora esta iniciativa de 1 a 6 (1 lo mínimo, 6 lo máximo).</h5>
			<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="2"}</p>
		</div>
		<div class="well well-mini">
			<h5><span class="">1.2</span> Te parece adecuado que dicha sistemática de participación conlleve un procedimiento de reconocimiento de la participación y que ésta, además, pueda ser valorada como  desempeño y/o mérito profesional?</h5>
			<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="3"}</p>
		</div>
		<div class="well well-mini">
			<h5><span class="">1.3</span> En los términos que se ha ido señalando en las dos anteriores preguntas, ¿estarías dispuesto a brindar tus conocimientos y tu experiencia profesional a la Organización, participando en los proyectos que despierten tu mayor interés?</h5>
			<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="4"}</p>
		</div>
		<div class="well well-mini">
		<h5><span class="">1.4</span> Valora de los siguientes proyectos cual es el de mayor interés para tí.</h5>
		<p>{include file="cuestor/q5.tpl" disabled="false" id_pregunta="5"}</p>
		</div>
		<div class="well well-mini">
		<h5><span class="">1.5</span> ¿Te parece adecuado que la participación en los diferentes grupos de trabajo formalmente constituidos, tengan en su día y una vez consolidado el funcionamiento de la sistemática de participación, un tratamiento y reconocimiento similar al que actualmente recibe la Formación y la asistencia a cursos?</h5>
		<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="7"}</p>
		</div>
		<div class="well well-mini">
		<h5><span class="">1.6</span> Valora de 1 a 6 la iniciativa de la Dirección de RRHH de articular una sistemática de comunicación interna para informar veraz, puntual y rigurosamente de aquellos asuntos que más preocupan a las personas.</h5>
		<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="8"}</p>
		</div>
		<div class="well well-mini">
		<h5><span class="">1.7</span> ¿Te inclinarías por un CANAL INSTITUCIONAL a la hora de informarte de asuntos que afectan a la vida profesional y laboral de las personas de la Administración y Servicios de la US?</h5>
		<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="10"}</p>
		</div>
		<div class="well well-mini">
		<h5><span class="">1.8</span> De los siguientes campos de información (objeto del próximo plan de Comunicacion Interna previsto). ¿Cúal sería el de tu mayor interés?</h5>
		<p>{include file="cuestor/q11.tpl" disabled="false" id_pregunta="11"}</p>
		</div>
		<input type="button" class="btn btnNext pull-right" style="margin-left:20px" value="Siguiente">
		<input type="button" class="btn btnPrev pull-right" value="Anterior">
	</div>
	<!-- fin pagina 1 -->

<div class="tab-pane fade" id="pag2">
<h4>Carácter plurianual</h4>
<p>Vamos a llevar a la práctica real el uso de planes de mejora, paneles de indicadores y sistemáticas para el seguimiento de actuaciones. La planificación cuidadosa de cada actuación permite no solo conocer al detalle el estado de cada situación, sino que además facilita la toma de decisiones que permiten corregir desviaciones, lo cual hace de la planificación estructurada una herramienta de gestión que facilita enormemente el logro de objetivos. Pero para que todo funcione, es fundamental que se realice una planificación conjunta y coordinada, desde los planes estratégicos de la Universidad de Sevilla o el Programa del Rector, hasta los planes operativos del servicio o la unidad más pequeños de toda nuestra estructura.</p>

<div class="well well-mini">
<h5><span class="">2.1</span> ¿Te parece adecuado que la dirección de RRHH muestre una planificación plurianual de todas las actuaciones estratégicas y relacionadas con el desempeño de sus funciones?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="12"}</p>
</div>
<div class="well well-mini">
<h5><span class="">2.2</span> Te parece adecuada la información disponible actualmente en relación a la planificación de RRHH y a las actuaciones vinculadas (seguimiento ACPMCS, evaluación del desempeño, etc…)?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="13"}</p>
</div>
<div class="well well-mini">
<h5><span class="">2.3</span> La intención de la Dirección de RRHH de mostrar sus planes de trabajo deberá ser tomada como un ejemplo a seguir por todas las unidades. En relación a la tuya, ¿crees que ya hace algo parecido, mostrando públicamente sus objetivos y las actuaciones desplegadas para lograrlos?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="14"}</p>
</div>
<input type="button" class="btn btnNext pull-right" style="margin-left:20px" value="Siguiente">
<input type="button" class="btn btnPrev pull-right" value="Anterior">
</div>
<!-- -->
<!-- -->
<div class="tab-pane fade" id="pag3y4">
<h4>Ordenación de puestos de trabajo / Nuevas fórmulas de gestión</h4>
<p>El I Plan Propio del Pas contempla una reordenación de puestos de trabajo que permita una ágil aplicación de las nuevas fórmulas de gestión que introduce el EBEP y que facilite la identificación de las aportaciones de cada persona desde su puesto de trabajo y su impacto en el logro de los objetivos institucionales. Se pretende, con ello, lo mejor para la sostenibilidad de la Organización generando, al mismo tiempo, el mejor entorno posible de trabajo y el más seguro para todos.</p>

<div class="well well-mini">
<h5><span class="">3.1</span> Señala el parámetro que,  según tu opinión, más debería puntuar en una provisión de puestos de trabajo.</h5>
<p>{include file="cuestor/q47.tpl" disabled="false" id_pregunta="47"}</p>
</div>
<div class="well well-mini">
<h5><span class="">3.2</span> Conforme al Test de Cultura del pasado mes de noviembre, solo un 14% de nuestra plantilla conoce totalmente los servicios en los que realmente impacta su trabajo. ¿Con qué grado de prioridad, de 1 a 6, te parece necesario que la Dirección de RRHH incorpore la corrección de esta situación en la definición de puestos de trabajo que está acometiendo? </h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="15"}</p>
</div>
<div class="well well-mini">
<h5><span class="">3.3</span> La Dirección de RRHH quiere cambiar el dato que dice que solo un 15% de nosotros se identifica con los logros de la Universidad de Sevilla como Institución. ¿Quién crees que tiene la mayor responsabilidad para modificar este dato?</h5>
<p>{include file="cuestor/otro_4.tpl" disabled="false" id_pregunta="16"}</p>
</div>
<div class="well well-mini">
<h5><span class="">3.4</span> ¿Crees que la actual  relación de puestos de trabajo se configura aplicando suficientes criterios objetivos en su definición?.</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="17"}</p>
</div>
<div class="well well-mini">
<h5><span class="">3.5</span> En el Test de Cultura mencionado, menos del 5% de los que han respondido reconoció  el máximo grado de flexibilidad, en la Universidad de Sevilla, para responder con solvencia a los cambios impuestos por el entorno. La Dirección de RRHH se dispone a reconducir esta situación, sabiendo que la flexibilidad puede reportar beneficios tanto a la organización como a las personas, pero, ¿hasta qué punto estás dispuesto a ofrecer tu colaboración?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="19"}</p>
</div>
<div class="well well-mini">
<h5><span class="">3.6</span> Teniendo encuenta que la valoración de puestos de trabajo repercute en el salario de la persona que ha de ocupar dicho puesto. Señala el parámetro que consideras más oportuno para valorar puestos de trabajo.</h5>
<p>{include file="cuestor/q48.tpl" disabled="false" id_pregunta="48"}</p>
</div>
<input type="button" class="btn btnNext pull-right" style="margin-left:20px" value="Siguiente">
<input type="button" class="btn btnPrev pull-right" value="Anterior">
</div>
<!-- -->

<!-- -->
<div class="tab-pane fade" id="pag5">
<h4>Formación y Acción Social</h4>
<p>Se trata de dos capítulos fundamentales para una gestión de los RRHH coherente con las personas, con sus necesidades y con el necesario bienestar que debe reinar en el ambiente de trabajo. Por ello, nos interesa tu opinión en relación a los compromisos recogidos en el I Plan Propio del PAS.</p>
<div class="well well-mini">
<h5><span class="">5.1</span> Una de las grandes ventajas competitivas de las organizaciones modernas se encuentra en la polivalencia de su personal. ¿Estarías dispuesto a colaborar en una espiral de acciones formativas en la que todos pudiesen aprender de todos (conllevaría ser, en ocasiones profesor, en ocasiones alumno)? Para esto sirven todas las personas, ya que todos tenemos algo que enseñar al resto.</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="21"}</p>
</div>
<div class="well well-mini">
<h5><span class="">5.2</span> ¿Te parece adecuado el nivel de información con el que hasta ahora ha venido siendo ejecutado el Plan Global de Acción Social?</h5>
<p>{include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="22"}</p>
</div>
<div class="well well-mini">
<h5><span class="">5.3</span> La dirección de RRHH se ha comprometido a presentar anualmente un Plan de Acción Social. Selecciona el aspecto más importantes que crees que debe considerar dicho plan:</h5>
<p>{include file="cuestor/q23.tpl" disabled="false" id_pregunta="23"}</p>
</div>
<input type="button" class="btn btnNext pull-right" style="margin-left:20px" value="Siguiente">
<input type="button" class="btn btnPrev pull-right" value="Anterior">
</div>
<!-- -->

<!-- -->
<div class="tab-pane fade" id="pag6">
<h4>Cuadro de mando de RRHH</h4>
<p>La implantación de un verdadero cuadro de mando de RRHH, que permita aplicar un enfoque preventivo en la toma de decisiones y facilite la incorporación de la Administración y Servicios a la Estrategia Institucional en los términos descritos en el I Plan Propio del PAS, requiere de una adecuada gestión de la cultura organizacional y, muy especialmente, del liderazgo. Porque, efectivamente, las personas son el motor de las organizaciones, y los responsables de equipos constituyen la cadena de transmisión entra la Organización y las personas que la conforman.</p>

<div class="well well-mini">
<h5><span class="">6.1</span> En al Test de Cultura Organizacional que se inició el pasado mes de noviembre, apenas un 9% reconoció el mayor grado posible la utilidad de los actuales procedimientos de la US, ¿de quién crees que es esta responsabilidad?</h5>
<p class="opcion_otro"> {include file="cuestor/q24.tpl" disabled="false" id_pregunta="24"} </p>
</div>
<div class="well well-mini">
<h5><span class="">6.2</span> Valora a tu superior directo como líder (la Universidad de Sevilla quiere lideres motivadores, que aporten experiencia y conocimiento, que eviten el conflicto y refuercen las capacidades de los miembros de su equipo y que, en definitiva, sean reconocidos por un comportamiento ejemplar).</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="25"} </p>
</div>
<div class="well well-mini">
<h5><span class="">6.3</span> Conforme al test de cultura organizacional de noviembre pasado, es necesario definir el estilo de liderazgo US,   ¿Crees que dicha definición explícita ayudaría a los líderes en el desempeño de su trabajo, de modo que se pudiese valorar objetivamente su actitud como líder?</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="26"} </p>
</div>
<div class="well well-mini">
<h5><span class="">6.4</span> Si las personas son el motor de la Organización, los líderes son motor de las personas y la Dirección RRHH, en particular, constituye el motor principal, liderando los procesos de cambio, adaptación y estandarización en el trato a todas las personas. Valora de 1 a 6 (1 lo mínimo, 6 lo máximo) el papel de la actual Dirección de RRHH en el desempeño de este papel institucional.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="27"} </p>
</div>
<div class="well well-mini">
<h5><span class="">6.5</span> El papel de la Dirección de RRHH, como motor último de la Administración y Servicios de la US, debe ser secundado por los responsables de las diferentes unidades, ¿crees que estos responsables también deben mejorar su desempeño en la coordinación y liderazgo de equipos de trabajo?</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="29"} </p>
</div>
<div class="well well-mini">
<h5><span class="">6.6</span> Una organización es flexible cuando lo son su personal y sus responsables. Valora, en este caso, el nivel de flexibilidad (adaptación rápida a nuevas necesidades y resolución ágil de imprevistos) de tu superior directo</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="30"} </p>
</div>
<div class="well well-mini">
<h5><span class="">6.7</span> La implantación del cuadro de Mando de RRHH que se señala en el I Plan Propio del PAS permitirá argumentar técnicamente las decisiones en materia de planificación de RRHH. Valora, de 1 a 6, esta iniciativa de la Dirección de RRHH.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="31"} </p>
</div>
<input type="button" class="btn btnNext pull-right" style="margin-left:20px" value="Siguiente">
<input type="button" class="btn btnPrev pull-right" value="Anterior">
</div>
<!-- -->

<!-- -->
<div class="tab-pane fade" id="pag7">
<h4>Aportación personal, Información general y I Plan Propio PAS</h4>
<p>En este último apartado podrás seguir expresando tu opinión  y aportar alguna información adicional sólo con fines estadísticos.</p><p>Finalmente podrás realizar un comentario libre para lo cual te recordamos el uso anónimo de toda la información facilitada.</p>
<div class="well well-mini">
<h5><span class="">7.1</span> La Dirección de RRHH ha elaborado un Plan Propio para el PAS que, dando respuesta al Programa del Rector, trata de dar al PAS el lugar que le corresponde en la Institución. El objetivo de la Dirección de RRHH es que todas las personas se sientan identificadas con este Plan, ¿hasta qué punto te identificas tú?</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="32"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.2</span> Hasta que punto te identificas con el proyecto de la actual Dirección de Recursos Humanos.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="34"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.3</span> Hasta que punto conoces la figura del Delegado del Rector para el PAS.</h5>
<p class="opcion_otro"> {include file="cuestor/opcion_6.tpl" disabled="false" id_pregunta="36"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.4</span> Señala el tiempo total desde el que eres Empleado
Público de la Universidad de Sevilla</h5>
<p class="opcion_otro"> {include file="cuestor/tiempo.tpl" disabled="false" id_pregunta="40"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.5</span> Señala el tiempo que llevas desempeñando tu actual puesto de trabajo</h5>
<p class="opcion_otro"> {include file="cuestor/tiempo.tpl" disabled="false" id_pregunta="41"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.6</span> Señala la descripción más aproximada de tu actual  puesto de trabajo</h5>
<p class="opcion_otro"> {include file="cuestor/q42.tpl" disabled="false" id_pregunta="42"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.7</span> Señala tu Plaza como Empleado Público de la Universidad de Sevilla</h5>
<p class="opcion_otro"> {include file="cuestor/q43.tpl" disabled="false" id_pregunta="43"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.8</span> En qué aspecto de la Administración y Servicios de la Universidad de Sevilla crees que impacta mayoritariamente tu trabajo cotidiano (señala solo una de ellas)</h5>
<p class="opcion_otro"> {include file="cuestor/q44.tpl" disabled="false" id_pregunta="44"} </p>
</div>
<div class="well well-mini">
<h5><span class="">7.9</span> Puede escribir comentarios en relación al I Plan Propio de RRHH y que usted considere que no han sido tratado en el mismo o en este Proyecto</h5>
<p class="opcion_otro"> {include file="cuestor/comentarios.tpl" disabled="false" id_pregunta="45"} </p>
</div>
<input type="button" class="btn btnNext pull-right" style="margin-left:20px" value="Siguiente">
<input type="button" class="btn btnPrev pull-right" value="Anterior">
</div>
</div>

</div>
</form>

{literal}
<script>
$('#cuestionario').validate({
rules:{
q1:{required:true},q2:{required:true},q3:{required:true},q4:{required:true},q5:{required:true},q7:{required:true},q8:{required:true},q10:{required:true},q11:{required:true},q12:{required:true},q13:{required:true},q14:{required:true},q15:{required:true},q16:{required:true},q17:{required:true},q19:{required:true},q21:{required:true},q22:{required:true},q23:{required:true},q24:{required:true},q25:{required:true},q26:{required:true},q27:{required:true},q29:{required:true},q30:{required:true},q31:{required:true},q32:{required:true},q34:{required:true},q36:{required:true},q40:{required:true},q41:{required:true},q42:{required:true},q43:{required:true},q44:{required:true},q47:{required:true},q48:{required:true}
},
ignore: "",
errorContainer: "#contenedor_errores",
errorLabelContainer: "#contenedor_errores",
errorElement: "span",
highlight: function(label) {
$('#contenedor_errores').removeClass('hide');
},
messages:{
q1:'<i class="icon-exclamation-sign"></i> Debe responder al compromiso en la pestaña de inicio<br />',
q2:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.1 de la Base 1 <br />',
q3:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.2 de la Base 1 <br />',
q4:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.3 de la Base 1<br />',
q5:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.4 de la Base 1<br />',
q7:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.5 de la Base 1 <br />',
q8:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.6 de la Base 1<br />',
q10:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.7 de la Base 1<br />',
q11:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 1.8 de la Base 1<br />',
q12:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 2.1 de la Base 2<br />',
q13:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 2.2  de la Base 2<br />',
q14:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 2.3 de la Base 2<br />',
q47:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 3.1 de la Base 3<br />',
q15:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 3.2 de la Base 3<br />',
q16:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 3.3 de la Base 3<br />',
q17:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 3.4 de la Base 3<br />',
q19:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 3.5 de la Base 3<br />',
q48:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 3.6 de la Base 3<br />',
q21:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 5.1 de la Base 5<br />',
q22:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 5.2 de la Base 5<br />',
q23:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 5.3 de la Base 5<br />',
q24:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 6.1 de la Base 6<br />',
q25:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 6.2 de la Base 6<br />',
q26:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 6.3 de la Base 6<br />',
q27:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 6.4 de la Base 6<br />',
q29:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 6.5 de la Base 6<br />',
q30:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 6.6 de la Base 6<br />',
q31:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 6.7 de la Base 6<br />',
q32:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.1 de las Aportaciones Personales<br />',
q34:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.2  de las Aportaciones Personales<br />',
q36:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.3 de las Aportaciones Personales<br />',
q40:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.4 de las Aportaciones Personales<br />',
q41:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.5 de las Aportaciones Personales<br />',
q42:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.6 de las Aportaciones Personales<br />',
q43:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.7 de las Aportaciones Personales<br />',
q44:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.8 de las Aportaciones Personales<br />',
q45:'<i class="icon-exclamation-sign"></i> Debe responder a la cuestión 7.9 de las Aportaciones Personales<br />'
}
});
//mostrar y borrar los campos text en el casos de otros
$('.activar_otro').on('click',function(){
	$(this).next('.nuevo_texto').removeAttr("disabled");
	$(this).siblings('.opcion_cerrada').removeAttr("checked");
	$(this).siblings('.opcion_cerrada').attr("name","noname");
});
$('.opcion_cerrada').on('click',function(){
	var id_pregunta = $(this).data("id_pregunta");
	$(this).siblings('.activar_otro').next('.nuevo_texto').attr("disabled","disabled");
	$(this).siblings('.activar_otro').removeAttr("checked");
	$(this).siblings('.nuevo_texto').val(' ');
	$('.q'+id_pregunta).attr("name",'q'+id_pregunta);
});

//para grabar comentarios del textarea
$('.textarea').focusout(function(){
var id_envio = $(this).data('id_envio');
var id_cuestionario = $(this).data('id_cuestionario');
var id_pregunta = $(this).attr('name').substr(1);;
var valor_abierto = $(this).val();
var valor_cerrado = 'texto';
$.ajax({
url:"index.php?page=cuestor/valor_grabar&ajax=true&id_envio="+id_envio+"&id_cuestionario="+id_cuestionario+"&id_pregunta="+id_pregunta+"&valor_abierto="+valor_abierto+'&valor_cerrado='+valor_cerrado,
});
});

//para grabar el nombre completo introducido por text y no cuando es introducido por radio
$('.nuevo_texto').focusout(function(){
var id_envio = $(this).data('id_envio');
var id_cuestionario = $(this).data('id_cuestionario');
var id_pregunta = $(this).attr('name').substr(1);;
var valor_abierto = $(this).val();
var valor_cerrado = 'otro';
//alert(id_envio+' '+id_cuestionario+' '+id_pregunta+' '+valor_cerrado+' '+valor_abierto);
$.ajax({
url:"index.php?page=cuestor/valor_grabar&ajax=true&id_envio="+id_envio+"&id_cuestionario="+id_cuestionario+"&id_pregunta="+id_pregunta+"&valor_abierto="+valor_abierto+'&valor_cerrado='+valor_cerrado,
});
});
//para grabar el nombre completo introducido por por radio
$('.pregunta').on('click',function(){
var id_envio = $(this).data('id_envio');
var id_cuestionario = $(this).data('id_cuestionario');
var id_pregunta = $(this).attr('name').substr(1);;
var valor_cerrado = $(this).val();
//alert(id_envio+' '+id_cuestionario+' '+id_pregunta+' '+valor_cerrado);
$.ajax({
url:"index.php?page=cuestor/valor_grabar&ajax=true&id_envio="+id_envio+"&id_cuestionario="+id_cuestionario+"&id_pregunta="+id_pregunta+"&valor_cerrado="+valor_cerrado,
});
});
//funciones para mostrar botones de siguiente, anterior, empezar y enviar cuestionario
function nextTab() {
var e = $('#tab li.active').next().find('a[data-toggle="tab"]');  
if(e.length > 0) e.click();  
isLastTab();
//$('html, body').animate({ scrollTop: 0 },2000);
return e;
}
function prevTab() {
var e = $('#tab li.active').prev().find('a[data-toggle="tab"]');  
e.tab('show');
return e;
}
function isLastTab() {
var e = $('#tab li:last').hasClass('active'); 
if( e )
{
$('.btnNext').val('Finalizar y Enviar'); 
$('.btnNext').addClass('btn-large'); 
}
else 
{
$('.btnNext').val('Siguiente'); 
}
return e;
}
$('.btnNext').on('click', function() {        
$('html, body').animate({ scrollTop: 0 },1000);
if(isLastTab()) 
$('#cuestionario').submit();
else 
nextTab();  
});
$('.btnPrev').on('click', function() {        
	$('html, body').animate({ scrollTop: 0 },1000);
	prevTab();  
});
$('a[data-toggle="tab"]').on('shown', function (e) {
isLastTab();
});
</script>
<style>
.alert-error {
	font-size:1.2em;
	padding:10px;
	
}
</style>
{/literal}
