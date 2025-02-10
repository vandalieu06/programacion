const puppeteer = require('puppeteer');

(
  async () => {
    try{
      console.log('Comenazondo busqueda: ');
      const browser = await puppeteer.launch({
        headless: false, 
        slowMo: 100,
        browser: 'firefox',
        userDataDir: null
      });
      const page = await browser.newPage();
      
      const url = ['https://zonatmo.com', 'https://mangadex.org/'];
      await page.goto(url[1], {timeout: 60000});
      await page.waitForSelector('h6');//La pagina esta cargando hasta que detecte un elemento con la classe seleccionada.
      const result = await page.evaluate(() => {
        const tags = Array.from(document.querySelectorAll('h6'));
        const data = tags.map((tag) => {
          let tags = tag.textContent;
          console.log(tag.textContent);
          return tags;
        })
        return data;

      });

      console.log('Tags: ', result);

      await page.close();
      await browser.close();
    }catch(err){
      console.error(err);
    }
  }
)();