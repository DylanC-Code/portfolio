<script>
	import PageTitle from '../PageTitle/PageTitle.svelte';
	import PersonalInfo from './PersonalInfo.svelte';
	import Resume from './Resume.svelte';

	const titleFirstPart = 'about';
	const titleSecondPart = 'me';
	const subTitle = 'Always exploring, always learning, always improving.';
</script>

<PageTitle {titleSecondPart} {titleFirstPart} {subTitle} />
<PersonalInfo />

<div class="mx-auto w-full max-w-[1170px] px-4">
	<hr class="mx-auto mb-12 mt-0 !border-t !border-t-black !border-opacity-10 bg-[#555] lg:mt-20" />
</div>

<Resume />
