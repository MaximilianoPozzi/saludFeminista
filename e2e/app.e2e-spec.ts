import { SaludFeministaPage } from './app.po';

describe('salud-feminista App', function() {
  let page: SaludFeministaPage;

  beforeEach(() => {
    page = new SaludFeministaPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
