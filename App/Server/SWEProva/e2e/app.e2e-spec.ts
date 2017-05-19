import { SWEProvaPage } from './app.po';

describe('sweprova App', () => {
  let page: SWEProvaPage;

  beforeEach(() => {
    page = new SWEProvaPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
