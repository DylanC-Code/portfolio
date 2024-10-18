<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';
	import CallToActionsHome from './CallToActionsHome.svelte';

	const roles = ['Dylan Castor', 'Developer', 'DevOps', 'Consultant'];
</script>

<div class="hidden h-full w-full flex-col justify-center text-white lg:flex">
	<div class="ml-[50vw] max-w-[500px] !bg-transparent !bg-none xl:max-w-[550px]">
		<h3 class="text-lg font-normal">Hi there !</h3>
		<h1
			class="relative mb-[10px] mt-[19px] whitespace-nowrap text-[42px] font-medium leading-[42px] text-white"
		>
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
			I am a passionate developer and DevOps engineer. I have a strong focus on building efficient,
			scalable systems and automating processes to deliver high-quality solutions. Technology
			fascinates me, and I love learning and integrating new tools and methodologies to continuously
			improve my craft.
		</p>

		<CallToActionsHome />
	</div>
</div>

<style>
	div {
		background:
			-40% / contain no-repeat url(/dark-about.png),
			#000000;
	}
</style>
