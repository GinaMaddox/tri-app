

/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Endurance Lab",
      appName: "endurance lab"
    };
  },
  created: function() {},
  methods: {
    submit: function(){
      console.log('event date submit')
      var params = {
        race_date: this.start
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/calendar");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  },
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      message: "Signup here",
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      race_date: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        first_name: this.first_name,
        last_name: this.last_name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation,
        race_date: this.race_date
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/dashboard");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};




var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};



var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};


var DashboardPage = {
  template: "#dashboard-page",
  data: function() {
    return {
      message: "Your Training Plan",
      workouts: [],

    };
  },
  created: function() {
    axios.get('/api/workouts').then(function(response) {
      console.log(response.data, this);
      this.workouts = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};


var CalendarPage = {
  template: "#calendar-page",
  data: function() {
    return {
      message: "",
      myEvents:[],
      

    };
  },
  created: function() {
    axios.get('/api/workouts').then(function(response) {
      console.log(response.data, this);
      this.myEvents = response.data;

      $(document).ready(function() {
        console.log(this);
        $('#calendar').fullCalendar({
          defaultView: 'month',
          firstDay: 1,
          eventBackgroundColor: "light blue",
          eventClick: function(calEvent, jsEvent, view) {
            alert('Description: ' + calEvent.swim + " " + calEvent.bike + " " + calEvent.run + " " + calEvent.run + " " + calEvent.total_hours);
          },
                
        

          // eventMouseover: function(event, jsEvent, view){
          //   event.week + " " + event.day
          // },
          header: {
            
            left: 'month,agendaWeek,agendaDay',
            center: 'title',
            right: 'today prev,next'
          },
          selectable: true,
          selectHelper: true,
          editable: true,
          eventLimit: true,
          events: this.myEvents
        });

      }.bind(this));
    }.bind(this));
    
    
  },
  methods: {
  },
  computed: {}
};
var UploadPage = {
  template: "#upload-page",
    data: function(){
      return {
        file: ''
      }
    },

    methods: {
      /*
        Submits the file to the server
      */
      submitFile(){
        /*
                Initialize the form data
            */
            let formData = new FormData();

            /*
                Add the form data we need to submit
            */
            formData.append('file', this.file);

        /*
          Make the request to the POST /single-file URL
        */
            axios.post( '/single-file',
                formData,
                {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
              }
            ).then(function(){
          console.log('SUCCESS!!');
        })
        .catch(function(){
          console.log('FAILURE!!');
        });
      },

      /*
        Handles a change on the file upload
      */
      handleFileUpload(){
        this.file = this.$refs.file.files[0];
      }
    }
  }
var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/dashboard", component: DashboardPage },
    { path: "/calendar", component: CalendarPage },
    { path: "/upload", component: UploadPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

