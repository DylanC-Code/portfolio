<script lang="ts">
	import selectedColor, { colors } from '$lib/stores/selectedColor';
	import { popup } from '@skeletonlabs/skeleton';
	import type { PopupSettings } from '@skeletonlabs/skeleton';

	const popupColors: PopupSettings = {
		event: 'click',
		target: 'popupColors',
		placement: 'left'
	};
</script>

<div
	class="fixed right-0 top-1/4 z-20 flex h-12 w-14 cursor-pointer items-center justify-center rounded-l-sm border bg-white"
	use:popup={popupColors}
>
	<i class="fa-xl fa-solid fa-gear fa-spin text-black"></i>
</div>

<div class="z-20 w-72 rounded-sm border bg-white p-4" data-popup="popupColors">
	<h4 class="border-b pb-2 font-poppins font-semibold uppercase text-black">Color changer</h4>
	<ul class="grid grid-cols-4 justify-items-center gap-y-3 pt-2">
		{#each colors as color}
			{@const fill = `fill-${color}`}
			<!-- svelte-ignore a11y-click-events-have-key-events -->
			<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
			<li on:click={() => selectedColor.set(color)} class="w-full cursor-pointer">
				<svg
					width="32"
					height="32"
					viewBox="0 0 32 32"
					fill="none"
					xmlns="http://www.w3.org/2000/svg"
					class="mx-auto"
				>
					<g clip-path="url(#clip0_27_2)">
						<path
							d="M4.42081 21.7008C1.99681 24.0816 4.04481 26.5264 0.825613 30.1472C-0.627187 31.784 6.80641 31.2848 10.488 27.6656C12.0512 26.128 11.6096 23.8912 9.93441 22.2432C8.25921 20.5984 5.98241 20.1632 4.42081 21.7008ZM31.2624 1.05441C30.0208 -0.167992 16.256 10.8608 12.16 14.888C10.1264 16.888 9.44801 17.96 8.82561 18.76C8.55361 19.1104 8.91361 19.216 9.07201 19.2976C9.87841 19.7104 10.4416 20.0912 11.1696 20.8064C11.8992 21.5216 12.288 22.0752 12.704 22.8688C12.7888 23.0256 12.8976 23.3776 13.2512 23.112C14.0672 22.4992 15.1568 21.8304 17.1904 19.8336C21.288 15.808 32.5072 2.27521 31.2624 1.05441Z"
							class={fill}
						/>
					</g>
				</svg>
			</li>
		{/each}
	</ul>
</div>
