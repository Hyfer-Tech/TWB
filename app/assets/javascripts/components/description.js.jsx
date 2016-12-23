let Description = React.createClass({
  getInitialState() {
    return {
      editable: false,
      description: this.props.description
    }
  },

  description() {
    if(this.state.editable) {
      return (
        <input ref="description" type="text" defaultValue={this.state.description} className='form-control'/>
      )
    } else {
      return (
        <span onClick={this.handleClick} >{this.state.description}</span>
      )
    }
  },

  handleClick() {
    if(this.state.editable) {
      let description = this.refs.description.value;
      let updated_user_info = { description }
      this.props.handleUpdate(updated_user_info);
      this.setState({description});
    }
    this.setState({editable: !this.state.editable});
  },

  // handleUpdate(updated_user_info) {
  //   let data = {};
  //   data[this.props.user_type_name] = updated_user_info;
  //
  //   $.ajax({
  //     url: `/${this.props.user_type_name}s`,
  //     type: 'PATCH',
  //     dataType: 'JSON',
  //     data: data
  //   });
  // },

  handleCancel() {
    this.setState({editable:false});
  },

  updateButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleClick} className="btn btn-sm btn-success">Update</button>
      )
    }
  },

  cancelButton() {
    if(this.state.editable) {
      return (
        <button onClick={this.handleCancel} className="btn btn-sm btn-danger">Cancel</button>
      )
    }
  },

  btnGroup(){
    if (this.state.editable) {
      return (
        <div className="btn-group pull-right" style={{marginBottom: "25px"}}>
          <br />
          { this.updateButton() }
          { this.cancelButton() }
          <br />
        </div>
      )
    }
  },

  render() {
    return (
      <div>
        <div className="col-xs-12">
          <h3>Description</h3>
        </div>
        <div className="col-xs-12">
          <div className="col-xs-12">
            {this.description()}
          </div>
          <div className="col-xs-12">
            {this.btnGroup()}
          </div>
        </div>
      </div>
    )
  }
})
