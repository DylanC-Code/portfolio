<script>
	import PageTitle from '../PageTitle/PageTitle.svelte';
	import ContactForm from './ContactForm/ContactForm.svelte';

	import ContactInfo from './ContactInfo/ContactInfo.svelte';

	const titleFirstPart = 'get';
	const titleSecondPart = 'in touch';
	const subTitle = 'I’m always open to discussing product design work or partnerships.';
</script>

<section id="contact" class="page-section page-section-active">
	<PageTitle {titleSecondPart} {titleFirstPart} {subTitle} />

	<div class="px-6 max-w-[1170px] mx-auto w-full sm:px-[30px] flex flex-wrap">
		<ContactInfo />

		<div class="px-6 w-full flex-[0_0_100%] md:flex-[0_0_66%]">
			<p class="mb-6 font-openSans leading-8">
				If you have any suggestion, project or even you want to say Hello.. please fill out the form
				below and I will reply you shortly.
			</p>

			<ContactForm />
		</div>
	</div>
</section>
