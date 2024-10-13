<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';
</script>

<div>
	<div class="text-left">
		<a href="#about" class="mr-[25px] bg-{$selectedColor} hover:text-white btn">
			<div class="bg-[#555]"></div>
			<span class="text-white">
				<i class="fa fa-user text-white"></i>
				more about me
			</span>
		</a>

		<a href="#portfolio" class="bg-transparent border border-{$selectedColor} btn">
			<div class="bg-{$selectedColor}"></div>
			<span class="text-{$selectedColor}">
				<i class="fa fa-suitcase text-{$selectedColor}"></i>
				portfolio
			</span>
		</a>
	</div>
</div>

<style>
	a:last-of-type:hover i,
	a:last-of-type:hover span {
		color: white;
	}
</style>
