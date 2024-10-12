<script lang="ts">
	import { _selectedColor } from '../../routes/+layout';
	import CallToActionsHome from './CallToActionsHome.svelte';
</script>

<!-- <section
	id="home"
	class="page-section page-section-active pl-[50%] pr-80 text-white flex flex-col justify-center"
> -->
<section id="home" class="page-section pl-[50%] pr-80 text-white flex flex-col justify-center">
	<h3 class="font-normal text-lg">Hi there !</h3>
	<h1 class="text-white text-[42px] font-medium mt-[19px] mb-[10px] relative whitespace-nowrap">
		I'm
		<span>
			<b style="opacity: 100 !important;">Dylan Castor</b>
			<b>Developer</b>
			<b>DevOps</b>
			<b>Consultant</b>
		</span>
	</h1>

	<p class="mt-[11px] mb-[23px] font-normal leading-8">
		Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit facilis esse ad cupiditate ducimus,
		ea id accusantium. Mollitia, hic suscipit. ea id accusantium. Mollitia, hic suscipit.
	</p>

	<CallToActionsHome />
</section>

<style>
	#home {
		background:
			-40% / contain no-repeat url(dark-about.png),
			#000000;
	}

	b {
		@apply text-warning-500 font-bold inline-block absolute whitespace-nowrap top-0 left-0 opacity-0;
	}

	h1 > span {
		@apply text-warning-500 overflow-hidden align-top p-0 inline-block relative text-left;

		font-size: 42px;
		line-height: 42px;
	}
</style>
