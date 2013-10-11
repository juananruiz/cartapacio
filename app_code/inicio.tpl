<div class="row-fluid">
  <div id="myCarousel" class="carousel slide well">
    <ol class="carousel-indicators">
    {foreach from=$editoriales item=editorial name="indice"}
      <li data-target="#myCarousel" data-slide-to="{$smarty.foreach.indice.iteration - 1}" class="">Hola pepe <img src="images/familia_funcional.jpg" /></li>
    {/foreach}
      <li data-target="#myCarousel" data-slide-to="2" class="">Hola pepe <img src="images/familia_funcional.jpg" width="220px"></li>
    </ol>
    <div class="carousel-inner" >
      {foreach from=$editoriales item=editorial name="editorial"}
        <div class="item {if $smarty.foreach.editorial.first} active{/if}">
           <h4>{$editorial.alias}</h4>
            <p>{$editorial.contenido|truncate:"500":'...'}</p>
            <p><a class="btn pull-right" href="index.php?page=editorial&id={$editorial.id}">Ver detalles »</a></p>
        </div>
      {/foreach}
    </div>
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
  </div><!-- .span4 -->
</div><!-- .row-fluid -->

<div class="row-fluid">
  <div class="span4">
    <h3>Heading</h3>
    <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
    <p><a class="btn" href="#">View details &raquo;</a></p>
  </div><!-- .span4 -->
</div><!-- .row-fluid -->

{literal}
	<script>
		$('#myCarousel').carousel()
	</script>
{/literal}
