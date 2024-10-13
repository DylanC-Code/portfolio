<script>
	import Experiences from './Experiences.svelte';

	const skillsImagesName = [
		'nodejs.svg',
		'python.svg',
		'bash.svg',
		'react.svg',
		'svelte.svg',
		'docker.svg',
		'kubernetes.svg',
		'terraform.svg',
		'github.svg',
		'jenkins.svg',
		'aws.svg'
	];
</script>

<section class="mx-auto max-w-[1170px] w-full px-6 sm:px-[30px]">
	<div class="flex flex-wrap -mx-[15px]">
		<Experiences></Experiences>
		<Experiences></Experiences>
		<div class="w-full py-12">
			<h2 class="px-4 font-semibold uppercase mb-12 text-2xl font-poppins">Skills</h2>

			<ul class="flex flex-wrap justify-around gap-4">
				{#each skillsImagesName as imageName}
					{@const [name] = imageName.split('.')}
					{@const src = `skills/${imageName}`}

					<li>
						<div class="flex justify-content items-center w-full h-[100px] mb-[10px]">
							<img {src} alt={name} class="mx-auto" />
						</div>
						<h4 class="h4 font-semibold mt-3">{name}</h4>
					</li>
				{/each}
			</ul>
		</div>
	</div>
</section>

<style>
	li {
		@apply text-center mb-5 flex-[28%] md:flex-[1_1_22%] lg:flex-[1_1_18%];
	}

	img {
		@apply w-full h-full object-contain max-w-[100px] mx-auto;
	}
</style>
