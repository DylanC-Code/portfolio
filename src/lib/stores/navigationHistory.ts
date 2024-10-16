import { get, writable } from 'svelte/store';

const navigationHistory = writable<Array<string>>([]);

function push(newPageName: string) {
	const pageNameIndex = get(navigationHistory).findIndex((pageName) => pageName === newPageName);

	if (pageNameIndex === -1)
		navigationHistory.update(($navigationHistory) => [...$navigationHistory, newPageName]);
	else
		navigationHistory.update(($navigationHistory) => $navigationHistory.toSpliced(pageNameIndex));
}

function pop() {
	let item: string;

	navigationHistory.update(($navigationHistory) => {
		item = $navigationHistory.pop() || 'home';
		return $navigationHistory;
	});

	return item;
}

export default {
	subscribe: navigationHistory.subscribe,
	update: navigationHistory.update,
	reset: () => navigationHistory.set([]),
	push,
	pop,
	get length() {
		return get(navigationHistory).length;
	}
};
