const Koa = require('koa');
const koaRouter = require('koa-router');
const app = new Koa();
const router1 = koaRouter();
const router2 = koaRouter();

// x-response-time

app.use(async (ctx, next) => {
  const start = Date.now();
  await next();
  const ms = Date.now() - start;
  ctx.set('X-Response-Time', `${ms}ms`);
});

// logger

app.use(async (ctx, next) => {
  const start = Date.now();
  await next();
  const ms = Date.now() - start;
  console.log(`${ctx.method} ${ctx.url} - ${ms}.`);
});

router1.get('/', function (ctx, next) {
    ctx.body = 'Hello, user.';
});

router2.get('/:name', function * (ctx, next) {

    let reqNum = 0;

    while (true) { 
        ctx.body = `hi, ${ctx.params.name}. Request # ${reqNum + 1}.`;
        yield ctx;
    }

});
router1.use('/users', router2.routes());

app.use(router1.routes());
app.listen(3000);
