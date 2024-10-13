<script>
	import PersonnalInfo from './PersonnalInfo.svelte';

	import { _selectedColor } from '../../routes/+layout';
	import Resume from './Resume.svelte';
</script>

<section id="about" class="page-section page-section-active">
	<header class="pt-[60px] pb-[54px] w-screen text-center">
		<h2 class="text-[55px] uppercase font-poppins font-black px-6 leading-[1.2]">
			about
			<span class="text-{$_selectedColor}">me</span>
		</h2>
		<span class="text-white opacity-80 relative inline-block uppercase text-[15px] mt-5 px-6">
			<div class="bg-{$_selectedColor} right-[-50px]"></div>
			I design and code beautiful things, and I love what I do.
			<div class="bg-{$_selectedColor} left-[-50px]"></div>
		</span>
	</header>

	<PersonnalInfo />

	<div class="mx-auto px-4 max-w-[1170px] w-full">
		<hr class="bg-[#555] mt-0 mx-auto mb-12 lg:mt-20" />
	</div>

	<Resume />
</section>

<style>
	hr {
		border-top: 1px solid rgba(0, 0, 0, 0.1) !important;
	}

	span > div {
		@apply hidden lg:block absolute h-[2px] top-[11px] w-[30px];
	}
</style>
