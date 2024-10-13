<script lang="ts">
	import selectedColor from '$lib/stores/selectedColor';
	import type { IPhase } from '$types/index';

	export let phases: Array<IPhase>;
	export let timelineName: string;
</script>

<div class="relative w-full px-4 md:max-w-[50%] md:flex-[0_0_50%]">
	<h2 class="mb-12 font-poppins text-2xl font-semibold uppercase">{timelineName}</h2>
	<ul>
		{#each phases as phase}
			<li class="relative pb-[50px]">
				<span
					class="border-l-{$selectedColor} absolute left-[7px] top-0 hidden h-full w-[1px] border opacity-60 content-[''] md:block"
				></span>
				<span
					class="border-{$selectedColor} absolute left-0 top-0 hidden h-[15px] w-[15px] rounded-full border-2 bg-surface-50 md:block"
				></span>

				<div
					class="relative flex w-full flex-col break-words rounded-md bg-transparent md:ml-10 md:w-[calc(100%-39px)]"
				>
					<header class="relative border-b-0 pb-3 pt-8">
						<span class="absolute -top-[2px] font-openSans text-xs font-normal opacity-80">
							<i class="fa fa-calendar hidden pr-3 md:inline-block"></i>
							<i class="fa fa-caret-right text-{$selectedColor} inline-block pr-3 md:hidden"></i>
							{phase.date}
						</span>

						<span class="block font-poppins uppercase">
							{phase.role}
							<span class="mx-2 mb-[4px] inline-block h-[2px] w-2 bg-[#555]"></span>
							<span class="font-poppins font-semibold uppercase text-white">{phase.entity}</span>
						</span>
					</header>

					<main class="flex-[1_1_auto] p-0">
						<p class="font-openSans text-sm leading-7">
							{phase.resume}
						</p>
					</main>
				</div>
			</li>
		{/each}
	</ul>
</div>
