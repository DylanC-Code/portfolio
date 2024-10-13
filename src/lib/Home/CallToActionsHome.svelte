<script lang="ts">
	import { _selectedColor } from '../../routes/+layout';
</script>

<div>
	<div class="text-left">
		<a href="#about" class="mr-[25px] bg-{$_selectedColor} hover:text-white btn">
			<div class="bg-[#555]"></div>
			<span class="text-white">
				<i class="fa fa-user text-white"></i>
				more about me
			</span>
		</a>

		<a href="#portfolio" class="bg-transparent border border-{$_selectedColor} btn">
			<div class="bg-{$_selectedColor}"></div>
			<span class="text-{$_selectedColor}">
				<i class="fa fa-suitcase text-{$_selectedColor}"></i>
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
