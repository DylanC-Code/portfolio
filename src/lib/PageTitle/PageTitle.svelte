<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';

	export let titleFirstPart: string;
	export let titleSecondPart: string;
	export let subTitle: string;
</script>

<header class="pt-[55px] pb-[49px] md:pt-[60px] md:pb-[54px] relative w-screen text-center">
	<h2 class="text-[35px] md:text-[55px] uppercase font-poppins font-black px-6 leading-[1.2]">
		<!-- <h2 class="text-[55px] uppercase font-poppins font-black px-6 leading-[1.2]"> -->
		{titleFirstPart}
		<span class="text-{$selectedColor}">{titleSecondPart}</span>
	</h2>
	<span class="text-white opacity-80 relative inline-block uppercase text-[15px] mt-5 px-6">
		<div class="bg-{$selectedColor} right-[-50px]"></div>
		{subTitle}
		<div class="bg-{$selectedColor} left-[-50px]"></div>
	</span>
</header>

<style>
	span > div {
		@apply hidden lg:block absolute h-[2px] top-[11px] w-[30px];
	}
</style>
