<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';
	import { onMount } from 'svelte';
	import CallToActionsHome from './CallToActionsHome.svelte';
	import { cubicInOut } from 'svelte/easing';

	const roles = ['Dylan Castor', 'Developer', 'DevOps', 'Consultant'];

	let displayedRoleIndex: number | null = null;
	let previousRoleIndex: number;

	onMount(() => {
		previousRoleIndex = displayedRoleIndex = 0;
	});

	function wordWrappingIn(node: Element) {
		const widthMax = node.clientWidth;
		return {
			duration: 1500,
			css(t: number) {
				if (t === 1) setTimeout(() => (displayedRoleIndex = null), 1500);

				const motion = cubicInOut(t);
				return `width: ${widthMax * motion}px`;
			}
		};
	}

	function wordWrappingOut(node: Element) {
		const widthMax = node.clientWidth;

		return {
			duration: 1500,
			delay: 1000,
			css(t: number) {
				if (t === 0)
					setTimeout(() => {
						if (previousRoleIndex === roles.length - 1) displayedRoleIndex = previousRoleIndex = 0;
						else displayedRoleIndex = previousRoleIndex += 1;
					}, 2500);

				const motion = cubicInOut(t);
				return `width: ${widthMax * motion}px`;
			}
		};
	}
</script>

<div class="hidden h-full w-full flex-col justify-center text-white lg:flex">
	<div class="ml-[50vw] max-w-[500px] !bg-transparent !bg-none xl:max-w-[550px]">
		<h3 class="text-lg font-normal">Hi there !</h3>
		<h1
			class="relative mb-[10px] mt-[19px] flex whitespace-nowrap text-[42px] font-medium leading-[42px] text-white"
		>
			I'm &nbsp;
			{#each roles as role, index}
				{#if index === displayedRoleIndex}
					<b
						class="whitespace-nowrap font-bold text-{$selectedColor} inline-block overflow-hidden"
						in:wordWrappingIn
						out:wordWrappingOut
					>
						{role}
					</b>
				{/if}
			{/each}
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
