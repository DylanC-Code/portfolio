<script>
	import Experiences from './Experiences.svelte';

	import { _selectedColor } from '../../routes/+layout';
</script>

<section class="mx-auto max-w-[1170px] w-full px-6 sm:px-[30px]">
	<div class="flex flex-wrap -mx-[15px]">
		<Experiences></Experiences>
		<Experiences></Experiences>
		<div class="flex flex-wrap">
			<h2 class="px-4 font-semibold uppercase pt-12 mb-12 text-2xl font-poppins">Skills</h2>
		</div>
	</div>
</section>
