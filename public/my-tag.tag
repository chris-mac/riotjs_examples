<my-tag>
  <h1>Hello { opts.greetee }</h1>
</my-tag>
<my-listtag>
  <li each={opts.list} class="{ name }"> { name }</li>
</my-listtag>

<to-do>
  <ul>
    <li each={ items } class={ completed: done }>
      <input type="checkbox" name="{ title }"checked={ done } onclick={ parent.toggle }> { title }
    </li>
  </ul>
<style scoped>
  .completed {
    text-decoration: line-through;
  }

</style>
<script>
this.items = [
  { title: 'First Item', done: true },
  { title: 'Second Item'},
  { title: 'Third Item'}
]

  toggle(e) {
    var item = e.item
    item.done = !item.done
    return true
  }
  myevent(e) {
  this.items[0]['title']=['Frank']
  }
</script>  
</to-do>


<to-do2>
  <ul>
    <li each={ items } hide={ done } class={ completed: done }>
      <input type="checkbox" name="mycheckbox" value={ title } checked={ done } onclick={ myevent }> { title }
    </li>
  </ul>
<button onclick={ myclear }>Click me</button>
<script>
this.items = [
  { title: 'First Item' },
  { title: 'Second Item'},
  { title: 'Third Item'}
]

  toggle(e) {
    var item = e.item
    item.done = !item.done
    return true
  }
  myevent(e) {
    console.log(e.target);
    //var self = this;
    //console.log(self.mycheckbox.value)
    var arrayLength = this.items.length;
      for (var i = 0; i < arrayLength; i++) {
        console.log(this.items[i]['done']);
        if(this.items[i]['done']=='true'){
          console.log('yeah its twoo');
          this.items[i]['done'] = '';
          console.log(this.items[i]['done']);
          continue;}
          if(this.items[i]['title']!= e.target.value) {
            console.log('this condition is being met');
            this.items[i]['done']='true';
          }
        
    }
  } 
  myclear(e) {
    var arrayLength = this.items.length;
      for (var i = 0; i < arrayLength; i++) {
          this.items[i]['done'] = '';
          console.log(this.items[i]['done']);
    }
  } 
</script>


</to-do2>


<hello-tag>
  <h1>{opts.greeting} <naming-tag value="{ what }" length="2"></naming-tag></h1>
<script>
 this.what = 'bobby'
</script>
</hello-tag>

<naming-tag>
  <span>{opts.value.substr(0, length)}</span>
  <script>
    var self = this,
        interval,
        count = 0;
    this.length = opts.length;
    

    this.on('update', function(){
       console.log('update');
    })
    this.on('mount', function(){
      console.log('mount');
      self.startAnimation();
    })
    this.on('unmount', function(){
      console.log('unmount');
      self.stopAnimation();
    })
    
    this.startAnimation = function(){
      interval = setInterval(function(){
        self.length++;
        if(self.length > opts.value.length){
          count++;
          if(count > 10) self.unmount();
          self.length = 0;
        }
      }, 50);
     };
   
    this.stopAnimation = function(){
      clearInterval(interval);
      interval = null;
    }
  </script>
</naming-tag>
