<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';

	export let titleFirstPart: string;
	export let titleSecondPart: string;
	export let subTitle: string;
</script>

<header class="relative w-screen pb-[49px] pt-[55px] text-center md:pb-[54px] md:pt-[60px]">
	<h2 class="px-6 font-poppins text-[35px] font-black uppercase leading-[1.2] md:text-[55px]">
		<!-- <h2 class="text-[55px] uppercase font-poppins font-black px-6 leading-[1.2]"> -->
		{titleFirstPart}
		<span class="text-{$selectedColor}">{titleSecondPart}</span>
	</h2>
	<span class="relative mt-5 inline-block px-6 text-[15px] uppercase text-white opacity-80">
		<div
			class="bg-{$selectedColor} absolute right-[-50px] top-[11px] hidden h-[2px] w-[30px] lg:block"
		></div>
		{subTitle}
		<div
			class="bg-{$selectedColor} absolute left-[-50px] top-[11px] hidden h-[2px] w-[30px] lg:block"
		></div>
	</span>
</header>