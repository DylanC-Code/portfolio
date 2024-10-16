import { browser } from '$app/environment';
import { get, writable } from 'svelte/store';
import navigationHistory from './navigationHistory';

const currentPage = writable('home');

function goto(pageName: string) {
	if (!browser) return;

	const currentPageName = get(currentPage);
	navigationHistory.push(currentPageName);

	currentPage.set(pageName);
}

function comeback() {
	const pageName = navigationHistory.pop();

	currentPage.set(pageName);
}

export const navigator = {
	goto,
	comeback,
	gotoSetter: (pageName: string) => () => goto(pageName)
};

export default { subscribe: currentPage.subscribe };
