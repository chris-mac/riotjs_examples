<my-eventtag>
  <h1>{opts.greeting} <trim value="{ what }" length="2"></trim></h1>
  <button onclick="{ tags.trim.startAnimation }">Start Animation</button>
  <button onclick="{ tags.trim.stopAnimation }">Stop Animation</button>
  <input type="text" value="{ what }" onkeyup="{ whatChange }"/>
<script>
 this.what = 'bobby'
 this.whatChange = function(e){
   this.what = e.target.value;
 }
</script>
</my-eventtag>

<trim>
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
</trim>

