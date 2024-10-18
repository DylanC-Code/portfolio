<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';
	import CallToActionsHome from './CallToActionsHome.svelte';

	const roles = ['Dylan Castor', 'Developer', 'DevOps', 'Consultant'];

	let displayedRoleIndex = 0;
	let displayedRoleEl: HTMLElement;

	function wordWrappingAnimation(element: HTMLElement) {
		const fullWidth = displayedRoleEl.clientWidth;

		displayedRoleEl.animate(
			[
				{ width: '0px', offset: 0, easing: 'ease-out' },
				{ width: `${fullWidth}px`, offset: 0.375 },
				{ width: `${fullWidth}px`, offset: 0.625 },
				{ width: '0px', offset: 1, easing: 'ease-out' }
			],
			3000
		);

		setTimeout(() => {
			if (displayedRoleIndex !== roles.length - 1) displayedRoleIndex += 1;
			else displayedRoleIndex = 0;
		}, 3000);
	}

	$: if (displayedRoleEl) wordWrappingAnimation(displayedRoleEl);
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
						bind:this={displayedRoleEl}
						class="inline-block overflow-hidden whitespace-nowrap font-bold text-{$selectedColor}"
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
