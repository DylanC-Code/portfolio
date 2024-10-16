<script lang="ts">
	import PageTitle from '$components/PageTitle/PageTitle.svelte';
	import { navigator } from '$lib/stores/currentPage';
	import selectedColor from '$lib/stores/selectedColor';
	import type { IProject } from '$types/index';

	export let projects: Array<IProject>;
</script>

<PageTitle
	titleFirstPart="my"
	titleSecondPart="portfolio"
	subTitle="a few recent design and coding projects. Want to see more? Email me.
"
/>

<main class="px-6">
	<ul class="mx-auto mb-8 grid max-w-[1170px] gap-6 md:grid-cols-2 lg:grid-cols-3">
		{#each projects as project, index}
			<li
				class=" bg-{$selectedColor} flex w-full items-center justify-center overflow-hidden rounded"
				on:click={() => navigator.continueTo(`project-${index}`)}
			>
				<img src={project.img} alt="Project {index}" class="duration-200" />
				<p class="absolute text-center text-xl font-medium uppercase opacity-0 duration-200">
					{project.name}
				</p>
			</li>
		{/each}
	</ul>
</main>

<style>
	li:hover > img {
		opacity: 0;
	}

	li:hover > p {
		opacity: 100;
	}
</style>
