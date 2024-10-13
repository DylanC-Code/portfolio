<script>
	import PageTitle from '../PageTitle/PageTitle.svelte';
	import PersonalInfo from './PersonalInfo.svelte';
	import Resume from './Resume.svelte';

	const titleFirstPart = 'about';
	const titleSecondPart = 'me';
	const subTitle = 'I design and code beautiful things, and I love what I do.';
</script>

<section id="about" class="page-section">
	<PageTitle {titleSecondPart} {titleFirstPart} {subTitle} />

	<PersonalInfo />

	<div class="mx-auto px-4 max-w-[1170px] w-full">
		<hr class="bg-[#555] mt-0 mx-auto mb-12 lg:mt-20" />
	</div>

	<Resume />
</section>

<style>
	hr {
		border-top: 1px solid rgba(0, 0, 0, 0.1) !important;
	}
</style>
