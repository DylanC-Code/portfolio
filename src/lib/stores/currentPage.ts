import { browser } from '$app/environment';
import { page } from '$app/stores';
import { writable } from 'svelte/store';

const currentPage = writable('home');

if (browser) {
	let toUnsubscribe = false;

	const unsubscribe = page.subscribe(($page) => {
		if (toUnsubscribe) return unsubscribe();

		if (!$page.url) return;
		const defaultPage = $page.url.hash.replace('#', '');
		currentPage.set(defaultPage);

		toUnsubscribe = true;
	});
}

export default {
	subscribe: currentPage.subscribe,
	set: currentPage.set,
	createPageSetter: (value: string) => () => currentPage.set(value)
};
