<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';
	import CallToActionsHome from './CallToActionsHome.svelte';

	const roles = ['Dylan Castor', 'Developer', 'DevOps', 'Consultant'];
</script>

<div class="hidden h-full w-full flex-col justify-center pl-[50%] pr-80 text-white lg:flex">
	<h3 class="text-lg font-normal">Hi there !</h3>
	<h1 class="relative mb-[10px] mt-[19px] whitespace-nowrap text-[42px] font-medium text-white">
		I'm
		<span
			class="relative inline-block overflow-hidden p-0 text-left align-top text-[42px] leading-[42px] text-{$selectedColor}"
		>
			{#each roles as role}
				<b
					class="absolute left-0 top-0 inline-block whitespace-nowrap font-bold text-{$selectedColor} opacity-0 first-of-type:opacity-100"
					>{role}</b
				>
			{/each}
		</span>
	</h1>

	<p class="mb-[23px] mt-[11px] font-normal leading-8">
		Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit facilis esse ad cupiditate ducimus,
		ea id accusantium. Mollitia, hic suscipit. ea id accusantium. Mollitia, hic suscipit.
	</p>

	<CallToActionsHome />
</div>

<style>
	div {
		background:
			-40% / contain no-repeat url(/dark-about.png),
			#000000;
	}
</style>
