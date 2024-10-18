<script>
	import PageTitle from '../PageTitle/PageTitle.svelte';
	import ContactForm from './ContactForm/ContactForm.svelte';

	import ContactInfo from './ContactInfo/ContactInfo.svelte';

	const titleFirstPart = 'get';
	const titleSecondPart = 'in touch';
	const subTitle = "The future is not what will happen, it's what you will make of it.";
</script>

<PageTitle {titleSecondPart} {titleFirstPart} {subTitle} />

<div class="mx-auto flex w-full max-w-[1170px] flex-wrap px-6 sm:px-[30px]">
	<ContactInfo />

	<!-- <div class="w-full flex-[0_0_100%] px-6 md:flex-[0_0_66%]"> -->
	<div class="w-full flex-[0_0_100%] md:flex-[0_0_66%]">
		<p class="mb-6 font-openSans leading-8">
			Got a cool project in mind or just want to say hi? Drop me a message and I’ll get back to you
			as soon as I can. Looking forward to hearing from you!
		</p>

		<ContactForm />
	</div>
</div>
