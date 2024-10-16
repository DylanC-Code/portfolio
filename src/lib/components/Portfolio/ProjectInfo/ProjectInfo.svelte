<script lang="ts">
	import Button from '$components/Button/Button.svelte';
	import selectedColor from '$lib/stores/selectedColor';
	import type { IProject } from '$types/index';

	export let opened: boolean;
	export let closeProjectHandler: () => void;
	export let project: IProject;

	const infosLabels = [
		{
			logo: 'fa-solid fa-file-text',
			name: 'Project',
			value: project.name
		},
		{
			logo: 'fa-solid fa-user',
			name: 'Client',
			value: project.client
		},
		{
			logo: 'fa-solid fa-hourglass',
			name: 'Duration',
			value: project.duration
		},
		{
			logo: 'fa-solid fa-code',
			name: 'Technologies',
			value: project.technologies.join(' | ')
		},
		{
			logo: 'fa-solid fa-money-bill',
			name: 'Budget',
			value: `${project.budget.price} ${project.budget.devise}`
		}
	];
</script>

<!-- svelte-ignore a11y-click-events-have-key-events -->
<!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
<!-- svelte-ignore a11y-no-static-element-interactions -->
<div
	class="fixed right-0 top-0 z-20 h-full w-full translate-x-full bg-surface-50 p-6 duration-200 lg:w-[760px]"
	class:translate-x-0={opened}
	on:click={closeProjectHandler}
>
	<div class="pb-8"><img src={project.img} alt={project.name} class="rounded" /></div>
	<div>
		<h3
			class="uppercase text-{$selectedColor} mb-6 font-poppins text-[34px] font-bold leading-[26px]"
		>
			{project.format} format
		</h3>

		<ul class="mb-3">
			{#each infosLabels as label}
				<li class="pb-3 font-openSans text-[15px] leading-7 text-white">
					<i class="{label.logo} inline-block w-6"></i>
					<span>{label.name} :</span>
					<span class="font-semibold uppercase">{label.value}</span>
				</li>
			{/each}
		</ul>

		<Button
			text="preview"
			elementClasses={{
				icon: 'fa-solid fa-arrow-up-right-from-square',
				button: `bg-${$selectedColor}`
			}}
		/>
	</div>
</div>
