<script lang="ts">
	import { onMount } from 'svelte';
	import { fade, fly } from 'svelte/transition';

	export let visible: boolean;

	let firstSpanElement: HTMLSpanElement;
	let secondSpanElement: HTMLSpanElement;
	let thirdSpanElement: HTMLSpanElement;

	function animateBurger(navVisible: boolean) {
		if (!firstSpanElement) return;

		const centerElement = 'translate(-50%, -50%) ';

		firstSpanElement.style.transform = `${centerElement} ${navVisible ? 'rotate(-45deg)' : ''}`;
		thirdSpanElement.style.transform = `${centerElement} ${navVisible ? 'rotate(45deg)' : ''}`;
	}

	onMount(() => {
		const y = secondSpanElement.offsetTop;
		const x = secondSpanElement.offsetLeft;

		firstSpanElement.style.top = y - 6 + 'px';
		firstSpanElement.style.left = x + 'px';
		thirdSpanElement.style.top = y + 6 + 'px';
		thirdSpanElement.style.left = x + 'px';
	});

	$: animateBurger(visible);
</script>

<!-- svelte-ignore a11y-missing-attribute -->
<a
	class="absolute z-30 top-0 left-0 h-[60px] w-[60px] rounded-full overflow-hidden whitespace-nowrap"
>
	<span
		bind:this={firstSpanElement}
		aria-hidden="true"
		class="burger-span origin-bottom-right"
		transition:fade
	></span>
	{#if !visible}
		<span
			bind:this={secondSpanElement}
			aria-hidden="true"
			class="burger-span left-1/2 top-1/2"
			transition:fly={{ opacity: 0, duration: 200 }}
		>
		</span>
	{/if}
	<span bind:this={thirdSpanElement} aria-hidden="true" class="burger-span origin-top-right"></span>
</a>
