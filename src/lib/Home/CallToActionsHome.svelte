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

		<a href="#work" class="bg-transparent border border-{$_selectedColor} btn">
			<div class="bg-{$_selectedColor}"></div>
			<span class="text-{$_selectedColor}">
				<i class="fa fa-suitcase text-{$_selectedColor}"></i>
				portfolio
			</span>
		</a>
	</div>
</div>

<style>
	.btn {
		/* @apply text-[15px] font-medium rounded-[26px] h-11 leading-[46px] uppercase px-[33px] outline-none overflow-hidden inline-block relative font-poppins tracking-[0.5px]; */
		@apply text-[15px] font-medium rounded-[26px] h-11 uppercase px-[33px] outline-none overflow-hidden inline-block relative font-poppins tracking-[0.5px];
	}

	.btn > div {
		@apply absolute top-0 -left-1/4 w-0 z-10 duration-[.6s] h-[102%];
		transform: skew(-22deg);
	}

	.btn > span {
		@apply relative z-20 font-poppins duration-150;
	}

	.btn i {
		@apply duration-150 pr-[11px];
	}

	.btn:hover > div {
		width: 180%;
	}

	a:last-of-type:hover i,
	a:last-of-type:hover span {
		color: white;
	}
</style>
