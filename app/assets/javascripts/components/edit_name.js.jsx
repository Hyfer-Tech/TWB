let EditName = React.createClass({
  getInitialState() {
    return { 
      editable: false,
      first_name: this.props.user.first_name,
      last_name: this.props.user.last_name
    };  
  },

  handleEdit() {
    if(this.state.editable) { 
      let updated_user_info = {
        first_name: this.state.first_name, 
        last_name: this.state.last_name
      }

      this.handleUpdate(updated_user_info);
    }
    
    this.setState({editable: !this.state.editable});  
  },

  firstName(){
    if(this.state.editable){
      return (
        <input type='text' ref='first_name' className='form-control'
               onChange={this.handleFirstNameChange}
               defaultValue={this.state.first_name} />
      )
    } else {
      return (
        <span onClick={this.handleEdit}>{this.state.first_name}</span>
      )
    }
  },

  lastName() {
    if(this.state.editable) {
      return (
        <div> 
          <input type='text' ref='last_name' className="form-control" 
                 onChange={this.handleLastNameChange}
                 defaultValue={this.state.last_name} />

          <button onClick={this.handleEdit}> Update </button>
        </div>
      )
    } else {
      return ( 
        <span onClick={this.handleEdit}>{this.state.last_name}</span>
      )
    }
  },

  handleFirstNameChange(e){
    let first_name = e.target.value;

    this.setState({ first_name: first_name });
  },

  handleLastNameChange(e) {
    let last_name = e.target.value;

    this.setState({ last_name: last_name });
  },

  handleUpdate(updated_user_info) {

    let data = {};
    data[this.props.user_type_name] = updated_user_info

    $.ajax({

      url: `/${this.props.user_type_name}s`,
      type: 'PATCH',
      dataType: 'JSON',
      data: data
    })

  },

  render() {
    return (
      <div className="text-center">
        <h3>{this.firstName()} {this.lastName()}</h3>
      </div>
    )
  }
});